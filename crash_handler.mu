exit(status int) void #Foreign("exit")

:crashAllocator IAllocator #Mutable
:crashHandlerLock SRWLOCK #Mutable

UIntPair struct {
	first uint
	second uint
}

enableCrashHandler() {
	InitializeSRWLock(ref crashHandlerLock)
	::crashAllocator = Memory.newArenaAllocator(64 * 1024)	
	SetUnhandledExceptionFilter(pointer_cast(crashHandler, pointer))
}

crashHandler(info *EXCEPTION_POINTERS) int #CallingConvention("__stdcall") {
	// Ignore "success" exceptions
	if info.ExceptionRecord.ExceptionCode < 0x80000000_u {
		return EXCEPTION_CONTINUE_SEARCH
	}

	lastError := GetLastError()

	AcquireSRWLockExclusive(ref crashHandlerLock)
	::currentAllocator = ::crashAllocator
	threadId := GetCurrentThreadId()

	sb := StringBuilder{}
	sb.write("Entering crash handler: exception code ")
	ulong.writeHexTo(info.ExceptionRecord.ExceptionCode, ref sb)
	sb.write("; thread id ")
	threadId.writeTo(ref sb)
	sb.write("; GetLastError ")
	lastError.writeTo(ref sb)
	infoStr := sb.compactToString()
	Stdout.writeLine(infoStr)

	if ::DEBUG {
		ReleaseSRWLockExclusive(ref crashHandlerLock)
		return EXCEPTION_CONTINUE_SEARCH
	}

	time := SYSTEMTIME{}
	GetLocalTime(ref time)
	name := format("big2v{}_crash_{}_{}_{}_{}_{}_{}.{}", Connection.version, time.wYear, time.wMonth, time.wDay, time.wHour, time.wMinute, time.wSecond, time.wMilliseconds)
	
	if !File.tryWriteString(format("{}.log", name), infoStr) {
		Stdout.writeLine("Failed to write crash dump: could not write log file")
	}

	file := CreateFileA(format("{}.mdmp", name).alloc_cstring(), GENERIC_READ | GENERIC_WRITE, FILE_SHARE_READ | FILE_SHARE_WRITE, null, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, null)
	if file == null {
		Stdout.writeLine("Failed to write crash dump: could not create mdmp file")
		exit(1)
		return EXCEPTION_CONTINUE_SEARCH
	}

	procHandle := GetCurrentProcess()
	procId := GetCurrentProcessId()
	info_ := transmute(info, UIntPair)
	mei := MINIDUMP_EXCEPTION_INFORMATION { ThreadId: threadId, ExceptionPointers_0: info_.first, ExceptionPointers_1: info_.second, ClientPointers: 1 }

	//if MiniDumpWriteDump(processHandle, processId, file, MINIDUMP_TYPE.MiniDumpWithFullMemory, exceptionData, null, null) != 0 {
	if MiniDumpWriteDump(procHandle, procId, file, MINIDUMP_TYPE.MiniDumpNormal, ref mei, null, null) != 0 {
		Stdout.writeLine("Crash dump written")
	} else {
		Stdout.writeLine(format("Failed to write crash dump: MiniDumpWriteDump failed with error code {}", GetLastError()))
	}

	CloseHandle(file)
	exit(1)
	return EXCEPTION_CONTINUE_SEARCH
}
