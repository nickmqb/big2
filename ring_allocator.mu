RingAllocator struct #RefType {
	from pointer
	to pointer
	begin pointer
	current pointer

	cons(capacity ssize) {
		from := ::currentAllocator.alloc(capacity)
		assert((transmute(from, usize) & 7) == 0) // Ensure qword aligned
		return RingAllocator { 
			from: from,
			to: from + capacity,
			current: from,
			begin: from,
		}
	}

	alloc(a RingAllocator, numBytes ssize) {
		assert(cast(numBytes, usize) <= cast(ssize.maxValue - 7, usize))
		numBytes = (numBytes + 7) & ~7 // Round up to next qword
		runway := 0_sz
		if a.current >= a.begin {
			runway = a.to.subtractSigned(a.current)
			if runway >= numBytes {
				ptr := a.current
				a.current += numBytes
				return ptr
			}
			a.current = a.from
		}
		runway = a.begin.subtractSigned(a.current)
		assert(numBytes < runway) // Do not allow buffer to fill up completely (we want a.begin == a.current to represent an empty ring buffer)
		ptr := a.current
		a.current += numBytes
		return ptr
	}

	realloc(a RingAllocator, ptr pointer, newSizeInBytes ssize, prevSizeInBytes ssize, copySizeInBytes ssize) {
		assert(cast(prevSizeInBytes, usize) <= cast(ssize.maxValue - 7, usize))
		prevSizeInBytes = (prevSizeInBytes + 7) & ~7
		newPtr := a.alloc(newSizeInBytes)
		Memory.memcpy(newPtr, ptr, checked_cast(min(copySizeInBytes, newSizeInBytes), usize))
		return newPtr
	}

	getMarker(a RingAllocator) {
		return a.current
	}

	freeUpToMarker(a RingAllocator, marker pointer) {
		if a.current >= a.begin {
			assert(a.begin <= marker && marker <= a.current)
		} else {
			assert(!(a.current < marker && marker < a.begin))
		}
		if marker >= a.begin {
			Memory.memset(a.begin, 0xfb, checked_cast(marker.subtractSigned(a.begin), usize))
		} else {
			Memory.memset(a.begin, 0xfb, checked_cast(a.to.subtractSigned(a.begin), usize))
			Memory.memset(a.from, 0xfb, checked_cast(marker.subtractSigned(a.from), usize))
		}
		a.begin = marker
	}

	iAllocator_escaping(a RingAllocator) {
		return IAllocator {
			data: pointer_cast(a, pointer),
			allocFn: pointer_cast(RingAllocator.alloc, fun<pointer, ssize, pointer>),
			reallocFn: pointer_cast(RingAllocator.realloc, fun<pointer, pointer, ssize, ssize, ssize, pointer>),
		}
	}
}

RingAllocator {
	debugInfo(a RingAllocator) {
		capacity := cast(a.to.subtractSigned(a.from), long)
		used := a.current >= a.begin ? a.current.subtractSigned(a.begin) : (capacity - a.begin.subtractSigned(a.current))
		return format("{} ({}%)", used, used * 100 / capacity)
	}

	detailedDebugInfo(a RingAllocator) {
		rb := StringBuilder{}
		p := a.from        
		step := a.to.subtractSigned(a.from) / 64
		for i := 0; i < 64 {
			q := p + step
			if q == a.to {
				q += 1
			}
			isBegin := p <= a.begin && a.begin < q
			isCurrent := p <= a.current && a.current < q
			isAlloc := a.current >= a.begin ? (a.begin <= p && p <= a.current) : (!(a.current < p && p < a.begin))
			if isBegin && isCurrent {
				rb.writeChar('X')
			} else if isBegin {
				rb.writeChar('B')
			} else if isCurrent {
				rb.writeChar('C')
			} else if isAlloc {
				rb.writeChar('#')
			} else {
				rb.writeChar('.')
			}
			p = q
		}
		return rb.toString()
	}
}
