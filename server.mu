ServerPlayer struct #RefType {
	playerIndex int
	clientIndex int
	name FixedCapList<char>
	score int
	deltaScore int
	isReady bool
	hasPassedThisCycle bool
	hand FixedCapList<Card>
}

ServerState struct #RefType {
	listener TcpListener
	clients ItemPool<$Client>
	newConnections Channel<TcpSocket>
	players Array<ServerPlayer>
	board FixedCapList<Card>
	round int
	turn int
	prevPlayer int
	hasDroppedClient bool
	numRounds int
}

Client struct #RefType {
	clientIndex int
	playerIndex int
	socket TcpSocket
	buffer Message
	bufferReadPos int
}

ServerThreadStartArgs struct {
	port ushort
	bindAny bool
	numAI int
}

Server {
	:defaultPort = 27191_us

	start(port ushort, bindAny bool, numRounds int, numAI int) {
		s := new ServerState {
			newConnections: new Channel.create<TcpSocket>(64),
			listener: TcpListener(port, bindAny),
			numRounds: numRounds,
		}

		createThread(acceptThread, pointer_cast(s, pointer))
		createThread(mainThread, pointer_cast(s, pointer))

		names := new List<string>{}
		names.add("Walt")
		names.add("Jesse")
		names.add("Saul")
		names.add("Skyler")
		names.add("Hank")
		names.add("Gus")
		names.add("Mike")
		names.add("Tuco")
		names.add("Todd")
		names.add("Gale")

		rs := randomSeed()
		shuffle(ref rs, ref names.asArray())

		for i := 0; i < min(numAI, 3) {
			AIClient.start(names[i], port)
		}
	}

	acceptThread(param pointer) uint {
		s := pointer_cast(param, ServerState)

		while true {
			addr := SOCKADDR_IN{}
			client := s.listener.tryAcceptClient(ref addr)
			if !client.hasValue {
				Stdout.writeLine("accept() failed, ignoring")
				continue
			}
			s.newConnections.send(client.value)
		}

		return 0
	}

	dropClient(s ServerState, cl Client) {
		if cl.socket.handle == INVALID_SOCKET {
			return
		}

		closesocket(cl.socket.handle)
		if cl.playerIndex >= 0 {
			p := s.players[cl.playerIndex]
			p.clientIndex = -1
		}
		cl.playerIndex = -1
		cl.socket = TcpSocket.invalid()

		s.hasDroppedClient = true
	}

	handleNewClient(s ServerState, ts TcpSocket) {
		ts.setNonBlocking()

		index := s.clients.count

		cl := s.clients.alloc()

		cl^ = Client {
			clientIndex: index,
			playerIndex: -1,
			socket: ts,
		}

		Stdout.writeLine(format("Client{}: accepted", cl.clientIndex))
	}

	tryHandleMessage(s ServerState, cl Client) {
		rr := Connection.tryReceiveMessage(cl.socket, ref cl.buffer, ref cl.bufferReadPos)
		if rr == ReadMessageResult.ok {
			handleMessage(s, cl, ref cl.buffer)
			return true
		} else if rr == ReadMessageResult.notReady {
			return false
		} else if rr == ReadMessageResult.disconnected {
			Stdout.writeLine(format("Client{}: disconnected, closing", cl.clientIndex))
			dropClient(s, cl)
			return false
		} else if rr == ReadMessageResult.socketError {
			Stdout.writeLine(format("Client{}: socket error, closing", cl.clientIndex))
			dropClient(s, cl)
			return false
		} else if rr == ReadMessageResult.badMessageLength {
			Stdout.writeLine(format("Client{}: bad message length, closing", cl.clientIndex))
			dropClient(s, cl)
			return false
		} else {
			abandon()
		}
	}

	handleMessage(s ServerState, cl Client, generic *Message) {
		if generic.type == MessageType.join {
			msg := transmute(generic^, JoinMessage)
			handleJoin(s, cl, msg)
		} else if generic.type == MessageType.play {
			msg := transmute(generic^, PlayMessage)
			handlePlay(s, cl, msg)
		} else if generic.type == MessageType.pass {
			handlePass(s, cl)
		} else if generic.type == MessageType.ready {
			handleReady(s, cl)
		} else if generic.type == MessageType.heartBeat {
			// OK
		} else {
			Stdout.writeLine(format("Client{}: bad message type, closing", cl.clientIndex))
			dropClient(s, cl)
		}
	}

	trySendMessage(s ServerState, cl Client, msg *Message) {
		sr := Connection.trySendMessage(cl.socket, msg)
		if sr {
			return true
		} else {
			Stdout.writeLine(format("Client{}: send failed, closing", cl.clientIndex))
			dropClient(s, cl)
			return false
		}
	}

	sendState(s ServerState, action StateMessage_Action) {
		msg := StateMessage {
			type: MessageType.state,
			length: sizeof(StateMessage),
			round: s.round,
			numRounds: s.numRounds,
			turn: s.turn,
			action: action,
		}

		for p, pi in s.players {
			msg.players.toArray()[pi] = StateMessage_Player {
				name: String16.from(p.clientIndex >= 0 ? p.name.toString() : ""),
				numCards: p.hand.count,
				score: p.score,
				deltaScore: p.deltaScore,
				isReady: p.isReady,
				hasPassedThisCycle: p.hasPassedThisCycle,
			}
		}

		msg.board.count = s.board.count
		for c, i in s.board.asArray() {
			msg.board.data.toArray()[i] = c.toByte()
		}

		for p, pi in s.players {
			if p.clientIndex >= 0 {
				msg.yourIndex = pi
				msg.yourHand = InlineList16.fromArray(ref p.hand.asArray().toByteArray())
				trySendMessage(s, s.clients.get(p.clientIndex), ref transmute(msg, Message))
			}
		}
	}

	getNewPlayerIndex(s ServerState, name string) {
		free := new List<int>{}
		for p, i in s.players {
			if p.clientIndex < 0 {
				if p.name.toString() == name {
					return i
				}
				free.add(i)
			}
		}

		if free.count == 0 {
			return -1
		}
		
		SecureRandom.shuffle(ref free.slice(0, free.count))
		return free[0]
	}

	handleJoin(s ServerState, cl Client, m JoinMessage) {
		if m.magicNumber != Connection.magicNumber {
			Stdout.writeLine(format("Client{}: invalid magicNumber, closing", cl.clientIndex))
			dropClient(s, cl)
			return
		}

		if m.version != Connection.version {
			Stdout.writeLine(format("Client{}: invalid version, closing", cl.clientIndex))
			dropClient(s, cl)
			return
		}

		name := m.name.allocString()
		if name == "" {
			Stdout.writeLine(format("Client{}: invalid name, closing", cl.clientIndex))
			dropClient(s, cl)
			return
		}

		pi := getNewPlayerIndex(s, name)
		if pi == -1 {
			Stdout.writeLine(format("Client{}: no more seats available, closing", cl.clientIndex))
			dropClient(s, cl)
			return
		}

		p := s.players[pi]
		p.name.copyString(name)
		p.clientIndex = cl.clientIndex
		p.isReady = true
		cl.playerIndex = pi
		Stdout.writeLine(format("Client{}: joined as {} ({})", cl.clientIndex, name, pi))
		
		sendState(s, StateMessage_Action { type: StateMessage_ActionType.update })
	}

	deal(s ServerState) {
		deck := new List<Card>{}
		deck.reserve(52)

		for r := 2; r <= 14 {
			for st := 0; st < 4 {
				deck.add(Card { suit: cast(cast(st, uint), Suit), rank: r })
			}		
		}

		SecureRandom.shuffle(ref deck.asArray())

		for p, pi in s.players {
			p.hand.clear()
			for i := 0; i < 13 {
				card := deck[deck.count - 1]
				deck.removeIndexShift(deck.count - 1)
				p.hand.add(card)
			}
			// DEBUG STUFF
			//if p.name.toString() == "Nick" {
			//	p.hand.removeIndexShift(0)
			//	p.hand.removeIndexShift(0)
			//	p.hand.removeIndexShift(0)
			//	p.hand.removeIndexShift(0)
			//	p.hand.add(Card { rank: 7, suit: Suit.clubs })
			//	p.hand.add(Card { rank: 7, suit: Suit.spades })
			//	p.hand.add(Card { rank: 7, suit: Suit.hearts })
			//	p.hand.add(Card { rank: 7, suit: Suit.diamonds })
			//	s.round = 2
			//	s.prevPlayer = pi
			//}
			p.hand.asArray().stableSort(Card.compare)
		}
	}

	beginRound(s ServerState) {
		if s.round < s.numRounds {
			s.round += 1
		} else {
			s.round = 1
			for p in s.players {
				p.score = 0
			}
		}

		s.board.clear()

		// Deal hands
		i := 0
		while i < 10 {
			deal(s)
			// If any hand is invalid (unlikely), deal again
			allValid := true
			for p in s.players {
				allValid = allValid && Rules.isValidHand(ref p.hand.asArray())
			}
			if allValid {
				break
			}
			i += 1
		}

		if s.round > 1 {
			// Game rule: winner of last round goes first
			s.turn = s.prevPlayer
		} else {
			// Game rule: in first round, player with 3d goes first
			for p, pi in s.players {
				for c in p.hand.asArray() {
					if c.suit == Suit.diamonds && c.rank == 3 {
						s.turn = pi
					}
				}
			}
		}

		assert(s.turn >= 0)
		newCycle(s)

		sendState(s, StateMessage_Action { type: StateMessage_ActionType.deal })
	}

	endOfRound(s ServerState, move Array<Card>) {		
		s.turn = -1

		winner := -1
		for p, pi in s.players {
			if p.hand.count == 0 {
				winner = pi
			}
		}
		assert(winner >= 0)

		totalScore := 0
		for p, pi in s.players {
			score := Rules.scoreHand(p.hand.count)
			p.deltaScore = -score
			totalScore += score
		}

		// Game rule: if previous player could have prevented win via single card, that player must pay for all others
		if move.count == 1 && s.prevPlayer >= 0 && s.prevPlayer != winner && Rules.hasBetterCard(ref s.players[s.prevPlayer].hand.asArray(), move[0]) {
			for p, pi in s.players {
				p.deltaScore = 0
			}
			s.players[s.prevPlayer].deltaScore = -totalScore
		}

		s.players[winner].deltaScore = totalScore

		for p in s.players {
			p.score += p.deltaScore
			p.isReady = false
		}

		s.prevPlayer = winner

		sb := StringBuilder{}
		sb.write(format("Round #{}", s.round))
		for p, pi in s.players {
			sb.write(format(" | {} {}", p.name.toString(), p.score))
		}

		Stdout.writeLine(sb.compactToString())
	}

	isEndOfCycle(s ServerState) {
		numPassed := 0
		for p in s.players {
			if p.hasPassedThisCycle {
				numPassed += 1
			}
		}

		assert(numPassed <= 3)
		return numPassed == 3
	}

	setBoard(s ServerState, move Array<Card>) {
		s.board.clear()
		for c in move {
			s.board.add(c)
		}
	}

	newCycle(s ServerState) {
		s.board.clear()
		for p in s.players {
			p.hasPassedThisCycle = false
		}
		s.prevPlayer = -1
	}

	advanceTurn(s ServerState) {
		assert(s.turn >= 0)
		
		s.prevPlayer = s.turn

		i := 0
		while i < 3 {
			s.turn = (s.turn + 1) % 4
			if !s.players[s.turn].hasPassedThisCycle {
				return
			}
		}
		
		abandon()
	}

	handlePlay(s ServerState, cl Client, m PlayMessage) {
		if s.turn != cl.playerIndex {
			Stdout.writeLine(format("Client{}: invalid play, closing", cl.clientIndex))
			dropClient(s, cl)
			return
		}

		move := new m.cards.toArray().toCardArray()
		hand := s.players[cl.playerIndex].hand

		for c in move {
			i := 0
			while i < hand.count {
				if hand.get(i) == c {
					hand.removeIndexShift(i)
				} else {
					i += 1
				}
			}
		}

		if ::DEBUG {
			Stdout.writeLine(format("{} plays {} ({})", s.players[cl.playerIndex].name.toString(), cardsToString(move), Rules.scoreMove(move)))
		}

		if hand.count == 0 {
			endOfRound(s, move)
			sendState(s, StateMessage_Action { type: StateMessage_ActionType.play, player: cl.playerIndex, cards: m.cards })
			setBoard(s, move)

		} else if Rules.isEndOfCycleMove(move) {
			sendState(s, StateMessage_Action { type: StateMessage_ActionType.play, player: cl.playerIndex, cards: m.cards, isEndOfCycle: true })
			setBoard(s, move)
			newCycle(s)

		} else {
			advanceTurn(s)
			sendState(s, StateMessage_Action { type: StateMessage_ActionType.play, player: cl.playerIndex, cards: m.cards })
			setBoard(s, move)
		}
	}

	handlePass(s ServerState, cl Client) {
		if s.turn != cl.playerIndex {
			Stdout.writeLine(format("Client{}: invalid pass, closing", cl.clientIndex))
			dropClient(s, cl)
			return
		}

		s.players[cl.playerIndex].hasPassedThisCycle = true

		advanceTurn(s)
		
		if isEndOfCycle(s) {
			sendState(s, StateMessage_Action { type: StateMessage_ActionType.pass, player: cl.playerIndex, isEndOfCycle: true })
			newCycle(s)
		} else {
			sendState(s, StateMessage_Action { type: StateMessage_ActionType.pass, player: cl.playerIndex })
		}
	}

	handleReady(s ServerState, cl Client) {
		if s.turn != -1 {
			Stdout.writeLine(format("Client{}: invalid ready, closing", cl.clientIndex))
			dropClient(s, cl)
			return
		}

		s.players[cl.playerIndex].isReady = true
		
		sendState(s, StateMessage_Action { type: StateMessage_ActionType.update })
	}

	mainThread(param pointer) uint {
		::currentAllocator = Memory.heapAllocator()

		ringAllocator := new RingAllocator(1024 * 1024)
		arenaAllocator := new ArenaAllocator(1024 * 1024)

		::currentAllocator = arenaAllocator.iAllocator_escaping()

		s := pointer_cast(param, ServerState)

		s.round = 0
		s.turn = -1

		s.clients = new ItemPool<$Client>(1024)
		
		s.players = new Array<ServerPlayer>(4)
		for i := 0; i < s.players.count {
			s.players[i] = new ServerPlayer { playerIndex: i, clientIndex: -1, name: new FixedCapList<char>(16), hand: new FixedCapList<Card>(16) }
		}

		s.board = new FixedCapList<Card>(8)

		sw := Stopwatch.create()

		::currentAllocator = ringAllocator.iAllocator_escaping()

		while true {
			while true {
				ts := s.newConnections.tryReceive()
				if !ts.hasValue {
					break
				}
				handleNewClient(s, ts.value)
			}

			for i := 0; i < s.clients.count {
				cl := s.clients.get(i)
				while true {
					if cl.socket.handle == INVALID_SOCKET || !tryHandleMessage(s, cl) {
						break
					}
				}
			}

			if s.turn == -1 {
				numReady := 0
				for p in s.players {
					if p.clientIndex >= 0 && p.isReady {
						numReady += 1
					}
				}

				if numReady == 4 {
					beginRound(s)
				}
			}

			if sw.elapsedSeconds() > 5 {
				for p, pi in s.players {
					if p.clientIndex >= 0 {
						trySendMessage(s, s.clients.get(p.clientIndex), ref Message { type: MessageType.heartBeat, length: sizeof(Message) })
					}
				}
				sw = Stopwatch.create()
			}

			if s.hasDroppedClient {
				sendState(s, StateMessage_Action { type: StateMessage_ActionType.update })
				s.hasDroppedClient = false
			}

			AllocatorDebugger.pointerScan(arenaAllocator, ringAllocator.from, ringAllocator.to)
			
			ringAllocator.freeUpToMarker(ringAllocator.current)

			Sleep(25)
		}

		return 0
	}
}
