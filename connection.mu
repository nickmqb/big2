MessageType {
	:join = 1
	:play = 2
	:pass = 3
	:ready = 4
	:state = 5
	:heartBeat = 6
}

Message struct {
	type int
	length int
	padding_0 InlineArray16<uint>
	padding_1 InlineArray16<uint>
	padding_2 InlineArray16<uint>
	padding_3 InlineArray16<uint>
}

JoinMessage struct {
	type int
	length int
	magicNumber int
	version int
	name String16
}

PlayMessage struct {
	type int
	length int
	cards InlineList8<byte>
}

StateMessage_Player struct {	
	name String16
	score int
	numCards int
	deltaScore int
	isReady bool
	hasPassedThisCycle bool
}

StateMessage_ActionType enum {
	update
	deal
	play
	pass
}

StateMessage_Action struct {
	type StateMessage_ActionType
	player int
	cards InlineList8<byte>
	isEndOfCycle bool
}

StateMessage struct {
	type int
	length int
	round int
	numRounds int
	turn int // -1 means in between rounds
	yourIndex int
	yourHand InlineList16<byte>
	players InlineArray4<StateMessage_Player>
	board InlineList8<byte>
	action StateMessage_Action
}

ReadMessageResult enum {
	ok
	notReady
	disconnected
	socketError
	badMessageLength
}

Connection {
	:version = 3
	:magicNumber = 0x32676962

	tryReceiveBytes(ts TcpSocket, buffer Array<byte>, index int, bufferPos *int) {
		assert(bufferPos^ <= index)
		if bufferPos^ == index {
			return ReadMessageResult.ok
		}
		count := ts.recv(ref buffer.slice(bufferPos^, index))
		if count > 0 {
			bufferPos^ += count
			assert(bufferPos^ <= index)
			if bufferPos^ == index {
				return ReadMessageResult.ok
			}
			return ReadMessageResult.notReady
		} else if count == 0 {
			return ReadMessageResult.disconnected
		} else {
			assert(count == SOCKET_ERROR)
			error := WSAGetLastError()
			if error == WSAEWOULDBLOCK {
				return ReadMessageResult.notReady
			} else {
				return ReadMessageResult.socketError
			}
		}
	}

	tryReceiveMessage(ts TcpSocket, msg *Message, bufferPos *int) {
		buffer := Array<byte> { dataPtr: pointer_cast(msg, pointer), count: sizeof(Message) }

		if bufferPos^ < 8 {
			rr := tryReceiveBytes(ts, ref buffer, 8, bufferPos)
			if rr != ReadMessageResult.ok {
				return rr
			}

			isValidLength := 8 <= msg.length && msg.length <= sizeof(Message)
			if !isValidLength {
				bufferPos^ = 0

				return ReadMessageResult.badMessageLength
			}
		}

		rr := tryReceiveBytes(ts, ref buffer, msg.length, bufferPos)
		if rr != ReadMessageResult.ok {
			return rr
		}

		bufferPos^ = 0

		return ReadMessageResult.ok
	}

	trySendBytes(ts TcpSocket, data Array<byte>) {
		offset := 0
		while offset < data.count {
			slice := data.slice(offset, data.count)
			bytes := ::send(ts.handle, pointer_cast(slice.dataPtr, *sbyte), slice.count, 0)
			if bytes == SOCKET_ERROR {
				return false
			}
			assert(0 <= bytes && bytes <= slice.count)
			offset += bytes
		}
		return true
	}

	trySendMessage(ts TcpSocket, msg *Message) {
		assert(8 <= msg.length && msg.length <= sizeof(Message))
		buffer := Array<byte> { dataPtr: pointer_cast(msg, pointer), count: msg.length }
		return trySendBytes(ts, ref buffer)
	}

	joinMessage(name string) {
		return JoinMessage { 
			type: MessageType.join,
			length: sizeof(JoinMessage),
			magicNumber: magicNumber,
			version: version,
			name: String16.from(name.slice(0, min(name.length, 16)))
		}
	}
}
