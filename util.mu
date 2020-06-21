DebugBreak() void #Foreign("DebugBreak")

createThread(proc fun<pointer, uint>, param pointer) {
	assert(CreateThread(null, 0, pointer_cast(proc, pointer), param, 0, null) != null)
}

LARGE_INTEGER struct {
	_LowPart uint
	_HighPart int
}
QueryPerformanceCounter(lpPerformanceCount *LARGE_INTEGER #As("LARGE_INTEGER *")) int #Foreign("QueryPerformanceCounter")
QueryPerformanceFrequency(lpFrequency *LARGE_INTEGER #As("LARGE_INTEGER *")) int #Foreign("QueryPerformanceFrequency")

Stopwatch struct {
	orig ulong

	:ticksPerSecond ulong #Mutable
	:secondsPerTick double #Mutable

	create() {
		// Note: very small chance this is called on multiple threads, simultaneously, but shouldn't cause problems
		if ticksPerSecond == 0 { 
			QueryPerformanceFrequency(pointer_cast(ref ticksPerSecond, *LARGE_INTEGER))
			assert(ticksPerSecond > 0)
			secondsPerTick = 1.0_d / ticksPerSecond
		}
		sw := Stopwatch{}
		QueryPerformanceCounter(pointer_cast(ref sw.orig, *LARGE_INTEGER))
		return sw
	}

	elapsedSeconds(sw Stopwatch) double {
		return elapsedTicks(sw) * secondsPerTick
	}

	elapsedTicks(sw Stopwatch) {
		now := 0_uL
		QueryPerformanceCounter(pointer_cast(ref now, *LARGE_INTEGER))
		assert(now >= sw.orig)
		return now - sw.orig
	}
}

readFile(path string, errorMessage string) {
	sb := StringBuilder{}
	if !File.tryReadToStringBuilder(path, ref sb) {
		Stderr.writeLine(errorMessage)
		abandon()
	}
	return sb.compactToString()
}

randomSeed() {
	value := 0_uL
	QueryPerformanceCounter(pointer_cast(ref value, *LARGE_INTEGER))
	return max(1, cast(value, uint))
}

randomInt(rs *uint, from int, to int) {
	n := cast(Random.xorshift32(rs) % cast(to - from, uint), int)
	return n + from
}

randomFloat(rs *uint, from float, to float) {
	i := Random.xorshift32(rs)
	return from + (i / cast(uint.maxValue, float)) * (to - from)
}

randomByte(rs *uint) {
	return cast(Random.xorshift32(rs), byte)
}

randomColor(rs *uint) {
	r := 255_b
	g := 0_b
	b := randomByte(rs)
	return ByteColor4.rgb(r, g, b)
}

shuffle(rs *uint, data Array<T>) {
	for i := 0; i < data.count - 1 {
		j := randomInt(rs, i, data.count)
		h := data[j]
		data[j] = data[i]
		data[i] = h
	}
}

lerp(t float, from float, to float) {
	if t <= 0 {
		return from
	} else if t >= 1 {
		return to
	}
	return t * to + (1 - t) * from
}

domain(t float, from float, to float) float {
	if from > to {
		return 1 - domain(t, to, from)
	}
	if t <= from {
		return 0
	} else if t >= to {
		return 1
	}
	return (t - from) / (to - from)
}

Array {
	toByteArray(array Array<Card>) {
		result := Array<byte>(array.count)
		for i := 0; i < array.count {
			result[i] = array[i].toByte()
		}
		return result
	}

	toCardArray(array Array<byte>) {
		result := Array<Card>(array.count)
		for i := 0; i < array.count {
			result[i] = Card.fromByte(array[i])
		}
		return result
	}
}

List {
	asArray(self List<T>) {
		return self.slice(0, self.count)
	}
}

// Note: once Muon supports compile time sized arrays, we can remove these!

InlineArray4<T> struct {
	item_0 T
	item_1 T
	item_2 T
	item_3 T

	toArray(self *InlineArray4<T>) {
		return Array.fromTypedPtr(ref self.item_0, 4)
	}
}

InlineArray8<T> struct {
	item_0 T
	item_1 T
	item_2 T
	item_3 T
	item_4 T
	item_5 T
	item_6 T
	item_7 T

	toArray(self *InlineArray8<T>) {
		return Array.fromTypedPtr(ref self.item_0, 8)
	}
}

InlineArray16<T> struct {
	item_0 T
	item_1 T
	item_2 T
	item_3 T
	item_4 T
	item_5 T
	item_6 T
	item_7 T
	item_8 T
	item_9 T
	item_10 T
	item_11 T
	item_12 T
	item_13 T
	item_14 T
	item_15 T

	toArray(self *InlineArray16<T>) {
		return Array.fromTypedPtr(ref self.item_0, 16)
	}
}

InlineList8<T> struct {
	data InlineArray8<T>
	count int

	toArray(self *InlineList8<T>) {
		assert(0 <= self.count && self.count <= 8)
		return Array.fromTypedPtr(ref self.data.item_0, self.count)
	}

	fromArray(array Array<T>) {		
		assert(0 <= array.count && array.count <= 8)
		result := InlineList8<T> { count: array.count }
		array.copySlice(0, array.count, ref result.toArray(), 0)
		return result
	}
}

InlineList16<T> struct {
	data InlineArray16<T>
	count int

	toArray(self *InlineList16<T>) {
		assert(0 <= self.count && self.count <= 16)
		return Array.fromTypedPtr(ref self.data.item_0, self.count)
	}

	fromArray(array Array<T>) {		
		assert(0 <= array.count && array.count <= 16)
		result := InlineList16<T> { count: array.count }
		array.copySlice(0, array.count, ref result.toArray(), 0)
		return result
	}
}

String16 struct {
	data InlineArray16<char>
	length int

	from(s string) {
		assert(s.length <= 16)
		result := String16 { length: s.length }
		Memory.memcpy(pointer_cast(ref result.data.item_0, pointer), s.dataPtr, checked_cast(s.length, uint))
		return result
	}

	allocString(s *String16) {
		return string.alloc(pointer_cast(ref s.data.item_0, pointer), min(s.length, 16))
	}
}

Channel<T> struct #RefType {
	items FixedCapList<T>
	lock SRWLOCK

	create<T>(capacity int) {
		ch := Channel<T> { items: new FixedCapList<T>(capacity) }
		InitializeSRWLock(ref ch.lock)
		return ch		
	}

	send(ch Channel<T>, item T) {
		AcquireSRWLockExclusive(ref ch.lock)
		ch.items.add(item)
		ReleaseSRWLockExclusive(ref ch.lock)
	}

	tryReceive(ch Channel<T>) {
		result := Maybe<T>{}
		AcquireSRWLockExclusive(ref ch.lock)
		if ch.items.count > 0 {
			item := ch.items.get(0)
			ch.items.removeIndexShift(0)
			result = Maybe.from(item)
		}
		ReleaseSRWLockExclusive(ref ch.lock)
		return result
	}
}

FixedCapList<T> struct #RefType {
	dataPtr pointer
	count int
	capacity int
	
	cons<T>(capacity int) {
		this := FixedCapList<T>{}
		assert(capacity >= 0)
		this.dataPtr = ::currentAllocator.alloc(CheckedMath.mulPositiveSsize(capacity, sizeof(T)))
		this.capacity = capacity
		return this
	}

	add(this FixedCapList<T>, item T) {
		assert(this.count < this.capacity)
		unchecked_index(pointer_cast(this, List<T>), this.count) = item
		this.count += 1
	}
	
	get(this FixedCapList<T>, index int) {
		return pointer_cast(this, List<T>)[index]
	}

	getRef(this FixedCapList<T>, index int) {
		return ref pointer_cast(this, List<T>)[index]
	}

	slice(this FixedCapList<T>, from int, to int) {
		assert(0 <= from && from <= to && to <= this.count)
		return Array<T> { dataPtr: this.dataPtr + cast(from, ssize) * sizeof(T), count: to - from }
	}
	
	removeIndexShift(this FixedCapList<T>, index int) {
		assert(0 <= index && index < this.count)
		dest := this.dataPtr + cast(index, ssize) * sizeof(T)
		src := dest + sizeof(T)
		Memory.memmove(dest, src, cast(cast(this.count - (index + 1), ssize) * sizeof(T), usize))
		this.count -= 1
	}
	
	removeIndexSwap(this FixedCapList<T>, index int) {
		assert(0 <= index && index < this.count)
		unchecked_index(pointer_cast(this, List<T>), index) = unchecked_index(pointer_cast(this, List<T>), this.count - 1)
		this.count -= 1
	}

	clear(this FixedCapList<T>) {
		this.count = 0
	}
	
	setCountChecked(this List<T>, count int) {
		assert(0 <= count && count <= this.count)
		this.count = count
	}

	asArray(self FixedCapList<T>) {
		return self.slice(0, self.count)
	}

	copyString(this FixedCapList<char>, s string) {
		assert(s.length <= this.capacity)
		Memory.memcpy(this.dataPtr, s.dataPtr, checked_cast(s.length, usize))
		this.count = s.length
	}

	toString(this FixedCapList<char>) {
		return string.from(this.dataPtr, this.count)
	}
}

ItemPool<T> struct #RefType {
	dataPtr pointer
	count int
	capacity int
	
	cons<T>(capacity int) {
		this := ItemPool<T>{}
		assert(capacity >= 0)
		this.dataPtr = ::currentAllocator.alloc(CheckedMath.mulPositiveSsize(capacity, sizeof(T)))
		this.capacity = capacity
		return this
	}

	alloc(this ItemPool<T>) *T {
		assert(this.count < this.capacity)
		result := ref unchecked_index(pointer_cast(this, List<T>), this.count)
		this.count += 1
		return result
	}

	get(this ItemPool<T>, index int) *T {
		return ref pointer_cast(this, List<T>)[index]
	}
}

AllocatorDebugger {
	pointerScan(aa ArenaAllocator, from pointer, to pointer) {
		if !::POINTER_SCAN {
			return
		}

		fromVal := transmute(from, ulong)
		toVal := transmute(to, ulong)
		data := Array<ulong> { dataPtr: aa.from, count: checked_cast((aa.current.subtractSigned(aa.from) + 7) / 8, int) }

		count := 0
		for val in data {
			if fromVal <= val && val < toVal {
				count += 1
			}
		}
		
		if count > 0 {
			Stdout.writeLine(format("Found {} suspicious pointer-like values (possible use-after-free)", count))
		}
	}
}

FpsCounter struct #RefType {
	samples FixedCapList<double>
	averageFps double

	create() {
		return FpsCounter { samples: new FixedCapList<double>(10) }
	}

	addSample(fc FpsCounter, dt double) {
		fc.samples.add(dt)

		if fc.samples.count < fc.samples.capacity {
			return
		}

		sum := 0.0_d
		for s in fc.samples.asArray() {
			sum += s
		}

		fc.averageFps = sum > 0 ? (fc.samples.count / sum) : 0
		fc.samples.clear()
	}
}

double {
	writeToFormatted(val double, sb StringBuilder, formatString cstring) {
		max := 64
		sb.reserveForWrite(max)
		size := snprintf_(sb.dataPtr + sb.count, cast(max, uint), formatString, val)
		assert(0 < size && size < max)
		sb.count += size
	}
}