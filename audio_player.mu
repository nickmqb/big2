
AudioDevice struct {
	id uint
	spec SDL_AudioSpec
}


getDefaultAudioSpec() {
	return SDL_AudioSpec {
		format: AUDIO_S16,
		freq: 44100,
		channels: 2,
		samples: 1024,
	}
}


openAudioDevice(spec *SDL_AudioSpec) {
	obtained := SDL_AudioSpec{}
	id := SDL_OpenAudioDevice(null, 0, spec, ref obtained, 0) //SDL_AUDIO_ALLOW_CHANNELS_CHANGE)
	assert(id != 0)
	return AudioDevice { id: id, spec: obtained }
}


loadWAV(file cstring, expectedSpec *SDL_AudioSpec) {
	rwops := SDL_RWFromFile(file, "rb")
	assert(rwops != null)
	spec := SDL_AudioSpec{}
	numBytes := 0_u
	data := pointer_cast(null, *byte)
	assert(SDL_LoadWAV_RW(rwops, 1, ref spec, ref data, ref numBytes) != null)
	assert(spec.format == expectedSpec.format)
	assert(spec.freq == expectedSpec.freq)
	assert(spec.channels == expectedSpec.channels)
	return Array<byte> { dataPtr: pointer_cast(data, pointer), count: checked_cast(numBytes, int) }
}


AudioTrack struct {
	sample Array<byte>
	pos int
}

AudioPlayer struct #RefType {	
	spec SDL_AudioSpec
	tracks FixedCapList<AudioTrack>
	newTracks FixedCapList<AudioTrack>
	allocator ArenaAllocator	
	lock SRWLOCK

	init(spec SDL_AudioSpec) {
		self := new AudioPlayer { spec: spec, tracks: new FixedCapList<AudioTrack>(128), newTracks: new FixedCapList<AudioTrack>(64), allocator: new ArenaAllocator(64 * 1024) }
		InitializeSRWLock(ref self.lock)
		return self
	}

	getTrack(self AudioPlayer, sample Array<byte>, delayInSeconds float) {
		return AudioTrack { sample: sample, pos: min(-cast(delayInSeconds * self.spec.freq, int) * 4, 0) }
	}

	play(self AudioPlayer, track AudioTrack) {
		AcquireSRWLockExclusive(ref self.lock)
		self.newTracks.add(track)
		ReleaseSRWLockExclusive(ref self.lock)
	}

	playMultiple(self AudioPlayer, tracks Array<AudioTrack>) {
		AcquireSRWLockExclusive(ref self.lock)
		for tr in tracks {
			self.newTracks.add(tr)
		}
		ReleaseSRWLockExclusive(ref self.lock)
	}

	callback(userData pointer, stream *byte, len int) {
		self := pointer_cast(userData, AudioPlayer)

		prevAlloc := ::currentAllocator 
		self.allocator.current = self.allocator.from
		::currentAllocator = self.allocator.iAllocator_escaping()
		
		Memory.memset(pointer_cast(stream, pointer), 0, checked_cast(len, uint))

		AcquireSRWLockExclusive(ref self.lock)
		for tr in self.newTracks.asArray() {
			self.tracks.add(tr)
		}
		self.newTracks.clear()
		ReleaseSRWLockExclusive(ref self.lock)

		for i := 0; i < self.tracks.count {
			tr := self.tracks.getRef(i)

			assert((tr.pos & 3) == 0) // Make sure pos is aligned to dword (2 channels * 16 bits per sample)

			if tr.pos <= -len {
				tr.pos += len
				continue
			}

			offset := 0
			max := len
			if tr.pos < 0 {
				offset = -tr.pos
				max = len - offset
				tr.pos = 0
			}

			remain := tr.sample.count - tr.pos
			if remain > 0 {
				play := min(max, remain)
				SDL_MixAudioFormat(pointer_cast(pointer_cast(stream, pointer) + offset, *byte), ref tr.sample[tr.pos], self.spec.format, cast(play, uint), 128)
				tr.pos += play
			} else {
				self.tracks.removeIndexSwap(i)
				i -= 1
			}
		}
	}
}