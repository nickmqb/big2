
tryConvertStringToAddress(s string) {
	addr := SOCKADDR{}
	size := sizeof(SOCKADDR)
	if WSAStringToAddressA(s.alloc_cstring(), AF_INET, null, ref addr, ref size) != 0 {
		return Maybe<SOCKADDR_IN>{}
	}
	return Maybe.from(transmute(addr, SOCKADDR_IN))
}


TcpSocket struct {
	handle ulong

	static_init() {
		data := WSADATA{}
		assert(WSAStartup(0x202_us, ref data) == 0)
	}

	invalid() {
		return TcpSocket { handle: INVALID_SOCKET }
	}

	localClient(port ushort) {
		addr_in := SOCKADDR_IN { sin_family: cast(AF_INET, ushort), sin_port: htons(port), sin_addr: IN_ADDR { addr: htonl(INADDR_LOOPBACK) } }
		return tryRemoteClient(ref addr_in).unwrap()
	}

	tryRemoteClient(addr_in *SOCKADDR_IN) {
		handle := socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)
		assert(handle != INVALID_SOCKET)
		addr := transmute(addr_in^, SOCKADDR)		
		ok := connect(handle, ref addr, sizeof(SOCKADDR_IN)) == 0
		return ok ? Maybe.from(TcpSocket { handle: handle }) : Maybe<TcpSocket>{}
	}

	setNonBlocking(ts TcpSocket) {
		mode := 1_u
		assert(ioctlsocket(ts.handle, FIONBIO, ref mode) == 0)
	}

	recv(ts TcpSocket, buffer Array<byte>) {
		return ::recv(ts.handle, pointer_cast(buffer.dataPtr, *sbyte), buffer.count, 0)
	}

	send(ts TcpSocket, buffer Array<byte>) {
		return ::send(ts.handle, pointer_cast(buffer.dataPtr, *sbyte), buffer.count, 0)
	}

	close(ts TcpSocket) {
		assert(closesocket(ts.handle) == 0)
	}    
}

TcpListener struct {
	handle ulong

	cons(port ushort, any bool) {
		handle := socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)
		assert(handle != INVALID_SOCKET)
		addr_in := SOCKADDR_IN { sin_family: cast(AF_INET, ushort), sin_port: htons(port), sin_addr: IN_ADDR { addr: htonl(any ? INADDR_ANY : INADDR_LOOPBACK) } }
		addr := transmute(addr_in, SOCKADDR)
		assert(bind(handle, ref addr, sizeof(SOCKADDR_IN)) == 0)
		assert(listen(handle, SOMAXCONN) == 0)
		return TcpListener { handle: handle }
	}

	tryAcceptClient(self TcpListener, addr *SOCKADDR_IN) {
		addrLen := sizeof(SOCKADDR_IN)
		handle := accept(self.handle, pointer_cast(addr, *SOCKADDR), ref addrLen)
		if handle == INVALID_SOCKET {
			return Maybe<TcpSocket>{}
		}		
		return Maybe.from(TcpSocket { handle: handle })
	}
}
