AIState struct #RefType {	
	ts TcpSocket
	rs uint
	name string
}

AIClientThreadStartArgs struct {
	name string
	port ushort
}

AIClient {	
	start(name string, port ushort) {
		args := new AIClientThreadStartArgs { name: name, port: port }
		createThread(mainThread, pointer_cast(args, pointer))
	}

	handleMessage(s AIState, m StateMessage) {
		if m.action.type == StateMessage_ActionType.play && m.turn == -1 {
			Sleep(cast(randomInt(ref s.rs, 3000, 7000), uint))
			Connection.trySendMessage(s.ts, new Message { type: MessageType.ready, length: sizeof(Message) })
			return
		}

		if m.turn != m.yourIndex {
			return
		}

		if m.yourHand.count == 0 {
			return
		}

		Sleep(cast(randomInt(ref s.rs, 1500, 2500), uint))

		hand := ref m.yourHand.toArray().toCardArray()
		board := ref m.board.toArray().toCardArray()
		if m.action.isEndOfCycle {
			board = ref Array<Card>{}
		} else if m.action.type == StateMessage_ActionType.play {
			board = ref m.action.cards.toArray().toCardArray()
		}

		move := Rules.findPossibleMove(hand, board)
		//num := min(randomInt(ref s.rs, 0, 2), cards.count)

		// DEBUG STUFF
		if false {
			opt := randomInt(ref s.rs, 0, 5)
			move = Array<Card>(5)
			if opt == 0 {
				move[0] = Card { suit: Suit.clubs, rank: 5 }
				move[1] = Card { suit: Suit.hearts, rank: 6 }
				move[2] = Card { suit: Suit.diamonds, rank: 7 }
				move[3] = Card { suit: Suit.hearts, rank: 8 }
				move[4] = Card { suit: Suit.hearts, rank: 9 }
			} else if opt == 1 {
				move[0] = Card { suit: Suit.spades, rank: 4 }
				move[1] = Card { suit: Suit.spades, rank: 7 }
				move[2] = Card { suit: Suit.spades, rank: 10 }
				move[3] = Card { suit: Suit.spades, rank: 11 }
				move[4] = Card { suit: Suit.spades, rank: 14 }
			} else if opt == 2 {
				move[0] = Card { suit: Suit.spades, rank: 14 }
				move[1] = Card { suit: Suit.clubs, rank: 14 }
				move[2] = Card { suit: Suit.diamonds, rank: 14 }
				move[3] = Card { suit: Suit.hearts, rank: 14 }
				move[4] = Card { suit: Suit.spades, rank: 3 }
			} else if opt == 3 {
				move[0] = Card { suit: Suit.spades, rank: 7 }
				move[1] = Card { suit: Suit.clubs, rank: 7 }
				move[2] = Card { suit: Suit.diamonds, rank: 7 }
				move[3] = Card { suit: Suit.hearts, rank: 5 }
				move[4] = Card { suit: Suit.spades, rank: 5 }
			} else {
				move[0] = Card { suit: Suit.hearts, rank: 10 }
				move[1] = Card { suit: Suit.hearts, rank: 11 }
				move[2] = Card { suit: Suit.hearts, rank: 12 }
				move[3] = Card { suit: Suit.hearts, rank: 13 }
				move[4] = Card { suit: Suit.hearts, rank: 14 }
			}
		}
		
		if move.count == 0 {
			Connection.trySendMessage(s.ts, new Message { type: MessageType.pass, length: sizeof(Message) })
			return
		}

		reply := PlayMessage {
			type: MessageType.play,
			length: sizeof(PlayMessage),
			cards: InlineList8.fromArray(ref move.toByteArray())
		}

		Connection.trySendMessage(s.ts, ref transmute(reply, Message))
	}

	mainThread(argsPtr pointer) uint {
		::currentAllocator = Memory.heapAllocator()

		ringAllocator := new RingAllocator(1024 * 64)
		arenaAllocator := new ArenaAllocator(1024 * 1024)

		::currentAllocator = arenaAllocator.iAllocator_escaping()

		args := pointer_cast(argsPtr, *AIClientThreadStartArgs)

		ts := TcpSocket.localClient(args.port)
		ts.setNonBlocking()
	
		s := new AIState {
			ts: ts,
			rs: randomSeed(),
			name: args.name,
		}

		Sleep(cast(randomInt(ref s.rs, 100, 1000), uint))
		Connection.trySendMessage(ts, ref transmute(Connection.joinMessage(args.name), Message))

		message := Message{}
		messageBufferPos := 0
		
		::currentAllocator = ringAllocator.iAllocator_escaping()

		while true {
			while true {
				rr := Connection.tryReceiveMessage(ts, ref message, ref messageBufferPos)
				if rr == ReadMessageResult.ok {
					if message.type == MessageType.state {
						handleMessage(s, transmute(message, StateMessage))
					}
				} else if rr == ReadMessageResult.notReady {
					break
				} else {
					return 0
				}
			}

			AllocatorDebugger.pointerScan(arenaAllocator, ringAllocator.from, ringAllocator.to)
			
			ringAllocator.freeUpToMarker(ringAllocator.current)

			Sleep(100)
		}
	}
}
