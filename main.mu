:DEBUG = false
:POINTER_SCAN = false

EventType enum {
	mouseDown
	mouseUp
	keyDown
	keyPress
}

Event struct {
	type EventType
	mousePos IntVector2
	scanCode SDL_Scancode
	text string
}

WidgetType enum {
	button
	textBox
}

Widget struct {
	id int
	type WidgetType
	bounds Box2	
}

ScreenType enum {
	message
	game
}

Player struct #RefType {
	name FixedCapList<char>
	numCards int
	score int
	deltaScore int
	isReady bool
	hasPassedThisCycle bool	
}

Animation struct {
	t float
	scale float

	isActive(a *Animation) {
		return a.scale != 0.0
	}

	fromSeconds(seconds float) {
		return Animation { scale: 1 / seconds }
	}

	advance(a *Animation, deltaSeconds float) {
		if a.scale == 0.0 {
			return false
		}
		a.t += deltaSeconds * a.scale
		if a.t >= 1.0 {
			a^ = Animation{}
			return true
		}
		return false
	}

	tInSeconds(a *Animation) {
		return a.t / a.scale
	}
}

RepeatingAnimation {
	sin01(sw Stopwatch, period float, phase float) {
		usec := cast(sw.elapsedSeconds() * 1000000, long)
		usecPeriod := cast(period * 1000000, long)
		t := ((usec % usecPeriod) / cast(usecPeriod, double) + phase) * 2 * pi
		return .5 + ::sin(cast(t, float)) * .5
	}
}

GameStage enum {
	endOfRound
	playing
}

HandCard struct {
	card Card
	isSelected bool
}

AnimationType enum {
	none
	deal
	play
	pass
	newCycle
}

ActionType enum {
	none
	play
	pass
	ready
}

SoundEffects struct #RefType {
	cardPlace1 Array<byte>
	cardPlace2 Array<byte>
	cardPlace3 Array<byte>
	cardPlace4 Array<byte>
	cardPlace Array<Array<byte>>
	charm Array<byte>
	charm2 Array<byte>
	win Array<byte>
}

AppState struct #RefType {
	ts TcpSocket
	hasSendFailed bool
	isError bool
	messageText FixedCapList<char>	
	stopwatchStart Stopwatch

	windowPtr pointer
	width int
	height int
	mouseOffsetY int
	isFullscreen bool
	fpsCounter FpsCounter
	isFpsVisible bool

	colorEffect ColorEffect
	gradientEffect GradientEffect
	textEffect TextEffect
	spriteEffect SpriteEffect
	spriteTexture Texture
	colorBuffer VertexPos2fColor4b_Buffer
	colorVertices FixedCapList<VertexPos2fColor4b>
	colorVertices2 FixedCapList<VertexPos2fColor4b>
	spriteVertices FixedCapList<VertexPos2fTex2fColor4b>
	spriteVertices2 FixedCapList<VertexPos2fTex2fColor4b>
	textVertices FixedCapList<VertexPos2fTex2fColor4b>

	audioPlayer AudioPlayer
	sfx SoundEffects

	widgets FixedCapList<Widget>
	mouseDownTarget int
	mouse IntVector2

	screenType ScreenType
	stage GameStage
	round int
	numRounds int
	turn int
	ourIndex int	
	players Array<Player>
	board FixedCapList<Card>
	hand FixedCapList<HandCard>
	ourAction ActionType
	isPrePass bool
	
	animation Animation
	animationType AnimationType
	animationPlayer int
	animationCards FixedCapList<Card>
	animationIsEndOfCycle bool
}

error(s AppState, message string) {
	if s.isError {
		return
	}
	s.isError = true
	s.screenType = ScreenType.message
	s.messageText.copyString(message)
}

boxHitTest(box Box2, p IntVector2) {
	return box.x0 <= p.x && p.x < box.x1 && box.y0 <= p.y && p.y < box.y1
}

hitTest(widgets FixedCapList<Widget>, pos IntVector2) {
	for i := widgets.count - 1; i >= 0; i -= 1 {
		w := widgets.get(i)
		if boxHitTest(w.bounds, pos) {
			return w.id
		}
	}
	return 0
}

findWidgetByID(widgets FixedCapList<Widget>, id int) {
	for w in widgets.asArray() {
		if w.id == id {
			return w
		}
	}
	abandon()
}

handleEvent(s AppState, e Event) {
	result := 0

	if e.type == EventType.mouseDown || e.type == EventType.mouseUp {
		target := hitTest(s.widgets, e.mousePos)
		if target != 0 {
			if e.type == EventType.mouseDown {
				result = target
				s.mouseDownTarget = target
			} else {
				if target == s.mouseDownTarget {
					result = target
				}
			}
		}
		if e.type == EventType.mouseUp {
			s.mouseDownTarget = 0
		}
	}

	return result
}


drawBackground(s AppState, transform Matrix) {
	s.colorVertices.clear()	
	GeometryHelper.mesh(0, 0, s.width, s.height, 20, 20, ByteColor4.rgb(42, 84, 42), s.colorVertices)
	s.gradientEffect.begin(transform)
	s.colorBuffer.render(s.colorVertices)
}

drawButton(s AppState, text string, bounds Box2, pressed bool, enabled bool, textColor ByteColor4, spriteVertices FixedCapList<VertexPos2fTex2fColor4b>, textVertices FixedCapList<VertexPos2fTex2fColor4b>) {
	pressed = pressed && enabled && boxHitTest(bounds, s.mouse)
	
	GeometryHelper.sprite(bounds.x0, bounds.y0, 1, Box2.fromSize(pressed ? 120 : 0, 1000, 20, 80), s.spriteTexture.size, spriteVertices)
	box := Box2.fromSize(pressed ? 140 : 20, 1000, 20, 80).scale2(s.spriteTexture.size.toVector2().invert())
	GeometryHelper.texturedQuad(bounds.x0 + 20, bounds.y0, bounds.x1 - 20, bounds.y1, box.x0, box.y0, box.x1, box.y1, spriteVertices)
	GeometryHelper.sprite(bounds.x1 - 20, bounds.y0, 1, Box2.fromSize(pressed ? 220 : 100, 1000, 20, 80), s.spriteTexture.size, spriteVertices)

	ofs := -2 + (pressed ? 4 : 0)
	x := (bounds.x0 + bounds.x1) * .5 + ofs
	y := (bounds.y0 + bounds.y1) * .5 + ofs
	textColor = enabled ? textColor : ByteColor4.rgb(220, 220, 220)
	GeometryHelper.centeredText(text, x, y, textColor, 1, s.textEffect.fontInfo, textVertices)
}

drawPassButton(s AppState, bounds Box2, pressed bool, enabled bool, spriteVertices FixedCapList<VertexPos2fTex2fColor4b>, textVertices FixedCapList<VertexPos2fTex2fColor4b>) {
	drawButton(s, "    Pass", bounds, pressed, enabled, ByteColor4.rgb(140, 43, 43), spriteVertices, textVertices)
	pressed = pressed && enabled && boxHitTest(bounds, s.mouse)
	ofs := -2 + (pressed ? 4 : 0)
	GeometryHelper.sprite(bounds.x0 + 20 + ofs, cast(lerp(0.5, bounds.y0, bounds.y1), int) - 15 + ofs, 1, Box2.fromSize((s.isPrePass ? 30 : 0) + (enabled ? 0 : 60), 1150, 30, 30), s.spriteTexture.size, s.spriteVertices2)
}


drawFps(s AppState) {
	if !s.isFpsVisible {
		return
	}
	fps := s.fpsCounter.averageFps
	//((dt / (1.0 / 60.0) - 1) * 100)
	sb := StringBuilder{}
	sb.write("AvgFps: ")
	fps.writeToFormatted(ref sb, "%.2f")
	GeometryHelper.text(sb.compactToString(), s.width - 350, 0, ByteColor4.rgb(0, 240, 240), 1, s.textEffect.fontInfo, s.textVertices)
}

sendMessageToServer(s AppState, msg *Message) {
	s.hasSendFailed = !Connection.trySendMessage(s.ts, msg)
}

MessageScreen {
	update(s AppState, events FixedCapList<Event>, dt float) {
	}

	render(s AppState) {
		transform := Matrix.ortho(0, s.height, s.width, 0)

		drawBackground(s, transform)

		s.textVertices.clear()

		GeometryHelper.centeredText(s.messageText.toString(), s.width * .5, s.height * .5, ByteColor4.white, 1, s.textEffect.fontInfo, s.textVertices)
		
		drawFps(s)

		s.textEffect.begin(transform)
		s.textEffect.render(s.textVertices)
	}
}

GameScreen {
	canPlaySelected(s AppState) {
		if !canPassNow(s) {
			return false
		}

		move := new List<Card>{}
		for hc in s.hand.asArray() {
			if hc.isSelected {
				move.add(hc.card)
			}
		}

		return Rules.isValidMove(ref s.board.asArray(), ref move.asArray())
	}

	isPassEnabled(s AppState) {
		return s.stage == GameStage.playing && (s.ourAction == ActionType.play || !s.players[s.ourIndex].hasPassedThisCycle)
			&& s.animationType != AnimationType.newCycle 
			&& (s.animationType != AnimationType.play || !s.animationIsEndOfCycle)
	}

	canPassNow(s AppState) {
		return s.stage == GameStage.playing && s.ourAction == ActionType.none && s.turn == s.ourIndex && s.animationType == AnimationType.none
	}

	canReady(s AppState) {
		return s.ourAction == ActionType.none && !s.players[s.ourIndex].isReady
	}

	playSelected(s AppState) {
		cards := new List<byte>{}

		s.animationCards.clear()
		for i := 0; i < s.hand.count {
			hc := s.hand.get(i)
			if hc.isSelected {
				cards.add(hc.card.toByte())
				s.hand.removeIndexShift(i)
				i -= 1
			}
		}

		s.players[s.ourIndex].numCards -= cards.count

		msg := PlayMessage {
			type: MessageType.play,
			length: sizeof(PlayMessage),
			cards: InlineList8.fromArray(ref cards.slice(0, cards.count))
		}

		sendMessageToServer(s, ref transmute(msg, Message))

		s.ourAction = ActionType.play
	}

	passOrPrePass(s AppState) {	
		if !canPassNow(s) {
			s.isPrePass = !s.isPrePass
			return
		}

		msg := Message {
			type: MessageType.pass,
			length: sizeof(Message),
		}

		sendMessageToServer(s, ref msg)

		s.ourAction = ActionType.pass
		s.isPrePass = true
	}

	ready(s AppState) {
		msg := Message {
			type: MessageType.ready,
			length: sizeof(Message),
		}

		sendMessageToServer(s, ref msg)

		s.ourAction = ActionType.ready
	}

	playDealSound(s AppState) {
		rs := randomSeed()
		for i := 0; i < 13 {
			s.audioPlayer.play(s.audioPlayer.getTrack(s.sfx.cardPlace[randomInt(ref rs, 1, 4)], i / 13.0 * .5 + randomFloat(ref rs, -1, 1) / 100.0))
		}
	}

	playMoveSound(s AppState, numCards int) {
		rs := randomSeed()
		for i := 0; i < numCards {
			s.audioPlayer.play(s.audioPlayer.getTrack(s.sfx.cardPlace[randomInt(ref rs, 1, 4)], i * 1.0 / numCards * .5))
		}
	}

	handleMessage(s AppState, m StateMessage) {
		s.round = m.round
		s.numRounds = m.numRounds
		s.turn = m.turn
		s.ourIndex = m.yourIndex

		// Unify current hand cards with new state
		isSelectedMap := Map.create<Card, bool>()
		if m.action.type != StateMessage_ActionType.deal {
			for hc in s.hand.asArray() {
				isSelectedMap.add(hc.card, hc.isSelected)
			}
		}

		s.hand.clear()
		for bc in m.yourHand.toArray() {
			card := Card.fromByte(bc)
			isSelected := isSelectedMap.maybeGet(card)
			s.hand.add(HandCard { card: card, isSelected: isSelected.hasValue && isSelected.value })
		}

		for p, pi in s.players {
			sp := m.players.toArray()[pi]
			p.name.copyString(sp.name.allocString())
			p.numCards = sp.numCards
			p.score = sp.score
			p.deltaScore = sp.deltaScore
			p.isReady = sp.isReady
			p.hasPassedThisCycle = sp.hasPassedThisCycle
		}

		s.board.clear()
		for bc in m.board.toArray() {
			s.board.add(Card.fromByte(bc))
		}

		if m.action.type == StateMessage_ActionType.deal {
			s.animationType = AnimationType.deal
			s.animation = Animation.fromSeconds(0.5)
			s.board.clear()
			s.ourAction = ActionType.none
			s.isPrePass = false
			s.stage = GameStage.playing
			playDealSound(s)
		} else if m.action.type == StateMessage_ActionType.play {
			move := new List<Card>{}
			for bc in m.action.cards.toArray() {
				move.add(Card.fromByte(bc))
			}			

			s.animationType = AnimationType.play
			if m.action.isEndOfCycle {
				s.animation = Animation.fromSeconds(3)
			} else if m.action.cards.count > 2 {
				s.animation = Animation.fromSeconds(3)
				if m.action.cards.count == 5 {
					kind := Rules.scoreMove5_(ref move.asArray()).kind
					if kind == MoveKind.fullHouse {
						s.audioPlayer.play(s.audioPlayer.getTrack(s.sfx.charm, 0))
					} else if kind == MoveKind.quads || kind == MoveKind.straightFlush {
						s.audioPlayer.play(s.audioPlayer.getTrack(s.sfx.charm2, 0))
					}
				}
			} else {
				s.animation = Animation.fromSeconds(1.5)
			}			
			s.animationPlayer = m.action.player
			s.animationIsEndOfCycle = m.action.isEndOfCycle
			s.animationCards.clear()
			for c in move {
				s.animationCards.add(c)
			}			
			s.ourAction = ActionType.none
			s.stage = GameStage.playing
			playMoveSound(s, s.animationCards.count)
		} else if m.action.type == StateMessage_ActionType.pass {
			s.animationType = AnimationType.pass
			s.animation = Animation.fromSeconds(1.5)
			s.animationPlayer = m.action.player
			s.animationIsEndOfCycle = m.action.isEndOfCycle
			s.ourAction = ActionType.none
			s.stage = GameStage.playing
		} else if m.action.type == StateMessage_ActionType.update {
			s.stage = s.turn >= 0 ? GameStage.playing : GameStage.endOfRound
		}
	}
	
	handleEndOfCycle(s AppState) {
		s.board.clear()
		for p in s.players {
			p.hasPassedThisCycle = false
		}
		s.isPrePass = false
		s.animationType = AnimationType.newCycle
		s.animation = Animation.fromSeconds(.5)
	}

	update(s AppState, messages FixedCapList<StateMessage>, events FixedCapList<Event>, dt float) {
		while true {
			if s.animationType != AnimationType.none {
				if !s.animation.advance(dt) {
					break
				}
				if s.animationType == AnimationType.play {
					s.board.clear()
					for c in s.animationCards.asArray() {
						s.board.add(c)
					}
					s.animationCards.clear()
					if s.turn == -1 {
						s.stage = GameStage.endOfRound
						if s.round == s.numRounds {
							s.audioPlayer.play(s.audioPlayer.getTrack(s.sfx.win, 0))
						}
					} else if s.animationIsEndOfCycle {
						handleEndOfCycle(s)
						break
					}
				} else if s.animationType == AnimationType.pass && s.animationIsEndOfCycle {
					handleEndOfCycle(s)
					break
				}
				s.animationType = AnimationType.none
			} else {
				if messages.count == 0 {
					break
				}
				m := messages.get(0)
				messages.removeIndexShift(0)
				handleMessage(s, m)
			}
		}

		if s.isPrePass && canPassNow(s) {
			passOrPrePass(s)
		}

		while true {
			s.widgets.clear()
			s.widgets.add(Widget { id: Widget.playButton, type: WidgetType.button, bounds: Box2.fromSize(s.width - 380 + 35, s.height - 120, 140, 80) })
			s.widgets.add(Widget { id: Widget.passButton, type: WidgetType.button, bounds: Box2.fromSize(s.width - 380 + 195, s.height - 120, 150, 80) })
			w := s.width - 760
			spacing := min(s.hand.count > 1 ? ((w - 150) / (s.hand.count - 1)) : 150, 150)
			actualWidth := (s.hand.count - 1) * spacing + 150

			for hc, i in s.hand.asArray() {
				id := Widget.firstCard + i
				yo := hc.isSelected ? -40 : 0
				x := cast(s.width * .5 - actualWidth * .5 + i * spacing, int)
				s.widgets.add(Widget { id: Widget.firstCard + i, type: WidgetType.button, bounds: Box2.fromSize(x, s.height - 200 + yo, 150, 200) })
			}

			if s.stage == GameStage.endOfRound {			
				bw := s.round == s.numRounds ? 240 : 160
				s.widgets.add(Widget { id: Widget.readyButton, type: WidgetType.button, bounds: Box2.fromSize(s.width * .5 - bw / 2, cast(s.height * .5, int) + 50, bw, 80) })
			}

			if events.count == 0 {
				break
			}

			e := events.get(0)
			events.removeIndexShift(0)
			clickedID := handleEvent(s, e)
			if e.type == EventType.mouseUp && clickedID == Widget.playButton && canPlaySelected(s) {
				playSelected(s)
			} else if e.type == EventType.keyDown && e.scanCode == SDL_Scancode.SDL_SCANCODE_RETURN && canPlaySelected(s) {
				playSelected(s)
			} else if e.type == EventType.mouseUp && clickedID == Widget.passButton && isPassEnabled(s) {
				passOrPrePass(s)
			} else if e.type == EventType.keyDown && e.scanCode == SDL_Scancode.SDL_SCANCODE_SLASH && isPassEnabled(s) {
				passOrPrePass(s)
			} else if e.type == EventType.mouseUp && clickedID == Widget.readyButton && canReady(s) {
				ready(s)
			} else if e.type == EventType.mouseDown && (Widget.firstCard <= clickedID && clickedID < Widget.firstCard + s.hand.count) && s.stage == GameStage.playing {
				index := clickedID - Widget.firstCard
				hc := ref s.hand.asArray()[index]
				hc.isSelected = !hc.isSelected
			}
		}
	}

	drawPlayer(s AppState, pi int, pos Vector2) {
		p := s.players[pi]
		 
		areaWidth := 320

		GeometryHelper.rect(pos.x, pos.y, pos.x + areaWidth, pos.y + 150, ByteColor4(0, 0, 0, 50), s.colorVertices)

		highlight :=
			((s.animationType == AnimationType.none || s.animationType == AnimationType.newCycle) && pi == s.turn) ||
			((s.animationType == AnimationType.play || s.animationType == AnimationType.pass) && pi == s.animationPlayer)
		if highlight {
			GeometryHelper.border(pos.x, pos.y, pos.x + areaWidth, pos.y + 150, 4, ByteColor4.gold, s.colorVertices)
		}

		if p.name.toString() != "" {
			GeometryHelper.text(p.name.toString(), pos.x + 10, pos.y + 7, p.hasPassedThisCycle ? ByteColor4.rgb(96, 96, 96) : ByteColor4.white, 1, s.textEffect.fontInfo, s.textVertices)

			if p.numCards > 0 {
				for i := 0; i < p.numCards {
					GeometryHelper.sprite(pos.x + 10 + i * 5, pos.y + 65, 1, Box2.fromSize(0, 800, 50, 66), s.spriteTexture.size, s.spriteVertices)
				}
			} else {
				GeometryHelper.sprite(pos.x + 10, pos.y + 65, 1, Box2.fromSize(50, 800, 50, 66), s.spriteTexture.size, s.spriteVertices)
			}

			GeometryHelper.text(format("{}", p.numCards), pos.x + 70 + max(p.numCards, 1) * 5, pos.y + 75, ByteColor4.white, 1, s.textEffect.fontInfo, s.textVertices)
		} else {
			GeometryHelper.text("Empty seat", pos.x + 10, pos.y + 7, ByteColor4.rgb(100, 200, 100), 1, s.textEffect.fontInfo, s.textVertices)
		}

		scoreText := format("{}", p.score)
		scoreSize := s.textEffect.fontInfo.getTextSize(scoreText)
		GeometryHelper.sprite(pos.x + areaWidth - 20 - scoreSize.x - 20, pos.y + 90, 1, Box2.fromSize(0, 900, 17, 17), s.spriteTexture.size, s.spriteVertices)
		GeometryHelper.text(scoreText, pos.x + areaWidth - 20 - scoreSize.x, pos.y + 75, ByteColor4.rgb(192, 192, 192), 1, s.textEffect.fontInfo, s.textVertices)

		if s.animationType == AnimationType.pass && s.animationPlayer == pi {
			GeometryHelper.centeredText("Pass", pos.x + areaWidth * .5, pos.y + 75 + ((pos.y < s.height * .5) ? 1 : -1) * 100, ByteColor4.rgb(0, 240, 240), 1, s.textEffect.fontInfo, s.textVertices)
		}
	}

	drawCard(s AppState, card Card, pos Vector2) {
		suit := cast(card.suit, uint)
		ci := card.rank - 2
		x := cast(pos.x, int)
		y := cast(pos.y, int)
		
		GeometryHelper.sprite(x, y, 1, Box2.fromSize(ci * 150, suit * 200, 150, 200), s.spriteTexture.size, s.spriteVertices)
	}

	drawHand(s AppState) {
		if s.animationType == AnimationType.play {
			t_showCards := domain(s.animation.tInSeconds(), 0, .5)
			t_slideCards := domain(domain(s.animation.tInSeconds(), 0, 1.5), .9, 1)
			
			xo := s.board.count > 0 ? lerp(t_slideCards, 15, 0) : 0
			yo := s.board.count > 0 ? lerp(t_slideCards, 40, 0) : 0
			sorted := Rules.sortCardsForDisplay(ref s.animationCards.asArray())
			for c, i in sorted {
				if i > cast(t_showCards * s.animationCards.count, int) {
					break
				}
				dx := i - (s.animationCards.count - 1) / 2.0
				drawCard(s, c, Vector2(s.width * .5 + dx * 160 - 75 + dx * xo, s.height * .5 - 140 + yo))
			}

			if s.animationIsEndOfCycle {
				GeometryHelper.sprite(s.width * .5 - 12, s.height * .5 + 150 - 12, 1, Box2.fromSize(0, 1100, 24, 24), s.spriteTexture.size, s.spriteVertices2)
			} else if s.animationCards.count > 2 {
				move := ref s.animationCards.asArray()
				ms := move.count == 5 ? Rules.scoreMove5(move[0], move[1], move[2], move[3], move[4]) : MoveScore{}
				str := ""
				blink := false
				if move.count < 5 {
					str = "Three-of-a-kind"
				} else if ms.kind == MoveKind.straight {
					str = "Straight"
				} else {
					str = format("{}!", Rules.moveKindToString(ms.kind))
					blink = ms.kind != MoveKind.flush
				}

				t_opacity := s.animation.t < .5 ? domain(s.animation.t, 0, .1) : domain(s.animation.t, 1, .9)
				t_slideIn := pow(domain(s.animation.t, 0, .1), .3)
				t_slideOut := (1 - pow(domain(s.animation.t, 1, .9), .3))
				
				strSize := s.textEffect.fontInfo.getTextSize(str)
				moveKindScale := domain(cast(ms.kind, uint), 1, 5) + 1
				textScale := lerp(t_opacity, .5, moveKindScale)
				x := s.width * .5 + (t_slideIn + t_slideOut - 1) * 1000 - strSize.x * textScale * .5
				y := s.height * .5 + 150 - strSize.y * textScale * .5
				for i := 0; i < str.length {
					t_ch := lerp(RepeatingAnimation.sin01(s.stopwatchStart, .2, 0), .3, 1)
					color := blink ? ByteColor4.floatRgba(1, .3, t_ch, t_opacity) : ByteColor4.white
					x += GeometryHelper.character(str[i], x, y, color, textScale, s.textEffect.fontInfo, s.textVertices)
				}
			}
		}

		//if s.animationType == AnimationType.pass && s.animationIsEndOfCycle {
		//	GeometryHelper.sprite(s.width * .5 - 12, s.height * .5 + 130 - 12, 1, Box2.fromSize(0, 1100, 24, 24), s.spriteTexture.size, s.spriteVertices2)
		//}

		for i := 0; i < s.hand.count {
			if s.animationType == AnimationType.deal && i > cast(s.animation.t * s.hand.count, int) {
				break
			}
			hc := s.hand.get(i)
			id := Widget.firstCard + i
			widget := findWidgetByID(s.widgets, id)
			drawCard(s, hc.card, Vector2(widget.bounds.x0, widget.bounds.y0))
		}
	}

	drawBoard(s AppState) {
		sorted := Rules.sortCardsForDisplay(ref s.board.asArray())
		for c, i in sorted {
			drawCard(s, c, Vector2(s.width * .5 - (s.board.count * 160 - 10) * .5 + i * 160, s.height * .5 - 140))
		}
	}

	comparePlayerByScore(a Player, b Player) {
		cmp := int.compare(b.score, a.score)
		if cmp != 0 {
			return cmp
		}
		return string.compare(a.name.toString(), b.name.toString())
	}

	comparePlayerByDeltaScore(a Player, b Player) {
		cmp := int.compare(b.deltaScore, a.deltaScore)
		if cmp != 0 {
			return cmp
		}
		return string.compare(a.name.toString(), b.name.toString())
	}

	drawEndOfRound(s AppState, endOfGame bool) {
		w := endOfGame ? 660 : 560
		h := 375
		yo := -40
		box := Box2.fromSize(s.width / 2 - w / 2, s.height / 2 - h / 2 + yo, w, h)
		GeometryHelper.rect(box.x0, box.y0, box.x1, box.y1, ByteColor4(26, 53, 26, 240), s.colorVertices2)

		sorted := ref Array<Player>(4)
		s.players.copySlice(0, 4, sorted, 0)
		sorted.stableSort(comparePlayerByScore)

		sortedByDelta := ref Array<Player>(4)
		s.players.copySlice(0, 4, sortedByDelta, 0)
		sortedByDelta.stableSort(comparePlayerByDeltaScore)

		heading := ""
		if endOfGame {
			winningPlayer := sorted[0]
			heading = winningPlayer.name.toString() != "" ? format("{} wins the game!", winningPlayer.name.toString()) : "End of game"
		} else {
			winningPlayer := sortedByDelta[0]
			heading = winningPlayer.name.toString() != "" ? format("{} wins!", winningPlayer.name.toString()) : "End of round"
		}

		GeometryHelper.centeredText(heading, (box.x0 + box.x1) * .5, box.y0 + 30, ByteColor4.white, 1, s.textEffect.fontInfo, s.textVertices)

		for p, i in sorted {
			y := s.height / 2 - 120 + yo + i * s.textEffect.fontInfo.height
			if p.isReady {
				GeometryHelper.sprite(box.x0 + 15, y + 12, 1, Box2.fromSize(0, 1100, 24, 24), s.spriteTexture.size, s.spriteVertices2)
			}
			rank := format("{}.", i + 1)
			rankSize := s.textEffect.fontInfo.getTextSize(rank)
			GeometryHelper.text(rank, box.x0 + 70 - rankSize.x / 2, y, ByteColor4.white, 1, s.textEffect.fontInfo, s.textVertices)
			name := p.name.toString()
			GeometryHelper.text(name, box.x0 + 100, y, ByteColor4.white, 1, s.textEffect.fontInfo, s.textVertices)
			nameSize := s.textEffect.fontInfo.getTextSize(name)
			deltaColor := p.deltaScore >= 0 ? ByteColor4.rgb(0, 255, 0) : ByteColor4.rgb(255, 80, 80)
			GeometryHelper.text(format("{}{}", p.deltaScore >= 0 ? "+" : "", p.deltaScore), box.x0 + 100 + nameSize.x + 20, y, deltaColor, 1, s.textEffect.fontInfo, s.textVertices)
			score := format("{}", p.score)
			scoreSize := s.textEffect.fontInfo.getTextSize(score)
			minusSize := s.textEffect.fontInfo.getTextSize("-")
			GeometryHelper.text(score, box.x1 - 60 - (scoreSize.x + (p.score < 0 ? minusSize.x : 0)) / 2, y, ByteColor4.rgb(255, 255, 255), 1, s.textEffect.fontInfo, s.textVertices)
		}

		drawButton(s, endOfGame ? "Play again" : "Ready", findWidgetByID(s.widgets, Widget.readyButton).bounds, s.mouseDownTarget == Widget.readyButton, canReady(s), ByteColor4.rgb(64, 64, 64), s.spriteVertices2, s.textVertices)
	}

	drawEndOfGame(s AppState) {
		drawEndOfRound(s, true)
	}

	render(s AppState) {
		transform := Matrix.ortho(0, s.height, s.width, 0)
		
		drawBackground(s, transform)

		s.colorVertices.clear()
		s.colorVertices2.clear()
		s.spriteVertices.clear()
		s.spriteVertices2.clear()
		s.textVertices.clear()

		if s.round < s.numRounds || s.stage != GameStage.endOfRound {
			GeometryHelper.text(format("{}/{}", max(1, s.round), s.numRounds), 5, 0, ByteColor4.rgb(192, 192, 192), 1, s.textEffect.fontInfo, s.textVertices)

			drawPlayer(s, s.ourIndex, Vector2(10, s.height - 150 - 10))
			drawPlayer(s, (s.ourIndex + 1) % 4, Vector2(10, 85))
			drawPlayer(s, (s.ourIndex + 2) % 4, Vector2(s.width / 2 - 160, 10))
			drawPlayer(s, (s.ourIndex + 3) % 4, Vector2(s.width - 320 - 10, 85))

			drawBoard(s)
			drawHand(s)

			if s.stage == GameStage.endOfRound {
				if s.round > 0 {
					drawEndOfRound(s, false)
				} else {
					numPlayers := 0
					for p in s.players {
						if p.name.toString() != "" {
							numPlayers += 1
						}
					}
					
					text := format("Waiting for players... ({}/4)", numPlayers)
					GeometryHelper.centeredText(text, s.width * .5, s.height * .5, ByteColor4.white, 1, s.textEffect.fontInfo, s.textVertices)			
				}
			}

			drawButton(s, "Play", findWidgetByID(s.widgets, Widget.playButton).bounds, s.mouseDownTarget == Widget.playButton, canPlaySelected(s), ByteColor4.rgb(0, 90, 0), s.spriteVertices, s.textVertices)
			drawPassButton(s, findWidgetByID(s.widgets, Widget.passButton).bounds, s.mouseDownTarget == Widget.passButton, isPassEnabled(s), s.spriteVertices, s.textVertices)
		} else {
			drawEndOfRound(s, true)
		}
		
		drawFps(s)

		s.colorEffect.begin(transform)
		s.colorBuffer.render(s.colorVertices)

		s.spriteEffect.begin(transform)
		s.spriteEffect.render(s.spriteVertices, s.spriteTexture.id)

		s.colorEffect.begin(transform)
		s.colorBuffer.render(s.colorVertices2)

		s.spriteEffect.begin(transform)
		s.spriteEffect.render(s.spriteVertices2, s.spriteTexture.id)

		s.textEffect.begin(transform)
		s.textEffect.render(s.textVertices)
	}
}

Widget {
	:playButton = 1
	:passButton = 2
	:readyButton = 3
	:firstCard = 100
}

//openGLErrorCallback(source int, type int, id uint, severity int, length int, message cstring, userParam pointer) void {
//	Stdout.writeLine(format("{} {} {} {} {}", source, type, id, severity, message))
//}
	//Stdout.writeLine(format("{}", pointer_cast(SDL_GetError(), cstring)))

main() {
	enableCrashHandler()

	::currentAllocator = Memory.heapAllocator()

	ringAllocator := new RingAllocator(1024 * 1024)
	arenaAllocator := new ArenaAllocator(1024 * 1024 * 64)

	::currentAllocator = arenaAllocator.iAllocator_escaping()

	TcpSocket.static_init()

	errors := new List<CommandLineArgsParserError>{}
	parser := new CommandLineArgsParser.from(Environment.getCommandLineArgs(), errors)
	args := parseArgs(parser)

	if args.noArgs {
		Stdout.writeLine("Parameters:")
		Stdout.writeLine("  -name [yourname]")
		Stdout.writeLine("  -join [address]")
		Stdout.writeLine("  -host")
		Stdout.writeLine("  -port [port]       (host only)")
		Stdout.writeLine("  -rounds [number]   (host only)")
		Stdout.writeLine("  -ai [number]       (host only)")
		Stdout.writeLine("  -hostonly          (host only)")
		Stdout.writeLine("  -log               (host only)")
		Stdout.writeLine("")
		Stdout.writeLine("Hotkeys:")
		Stdout.writeLine("  Enter   Play selected cards")
		Stdout.writeLine("  /       Pass")
		Stdout.writeLine("  F1      Show FPS")
		Stdout.writeLine("  F11     Full screen")
		exit(1)
	}

	if errors.count > 0 {
		info := parser.getCommandLineInfo()
		for errors {
			Stderr.writeLine(CommandLineArgsParser.getErrorDesc(it, info))
		}
		exit(1)
	}

	ByteColor4.static_init()

	s := ref AppState { width: 1500, height: 880 }

	if args.host {
		port := args.port > 0 ? args.port : Server.defaultPort
		rounds := args.rounds > 0 ? args.rounds : 8
		Server.start(port, args.numAI < 3, rounds, args.numAI, args.log)
		Stdout.writeLine("Server started")
		if args.hostOnly {
			while true {
				Sleep(1000)
			}
		}
		
		s.ts = TcpSocket.localClient(port)
	} else {
		if args.joinAddress.sin_port == 0 {
			args.joinAddress.sin_port = htons(Server.defaultPort)
		}
		Stdout.writeLine(format("Connecting... (port {})", ntohs(args.joinAddress.sin_port)))
		socket := TcpSocket.tryRemoteClient(ref args.joinAddress)
		if !socket.hasValue {
			Stdout.writeLine("Could not connect to host; exiting")
			exit(2)
		}
		Stdout.writeLine("Connected to host")
		s.ts = socket.unwrap()
	}

	s.ts.setNonBlocking()

	sendMessageToServer(s, ref transmute(Connection.joinMessage(args.name), Message))

	assert(SDL_Init(SDL_INIT_VIDEO | SDL_INIT_AUDIO | SDL_INIT_EVENTS) == 0)
	//assert(SDL_GL_SetAttribute(SDL_GLattr.SDL_GL_CONTEXT_FLAGS, cast(SDL_GL_CONTEXT_DEBUG_FLAG, int)) == 0)

	s.windowPtr = SDL_CreateWindow(pointer_cast(format("Big2 (v{})", Connection.version), *sbyte), SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, s.width, s.height, SDL_WINDOW_OPENGL | SDL_WINDOW_RESIZABLE)
	assert(s.windowPtr != null)

	glContextPtr := SDL_GL_CreateContext(s.windowPtr)
	assert(glContextPtr != null)

	//glDebugMessageCallback(pointer_cast(openGLErrorCallback, pointer), null)
	//glEnable(GL_DEBUG_OUTPUT)
	//glEnable(GL_DEBUG_OUTPUT_SYNCHRONOUS)

	s.colorEffect = ColorEffect.init()
	s.gradientEffect = GradientEffect.init()
	s.textEffect = TextEffect.init()
	s.spriteEffect = SpriteEffect.init()
	s.colorBuffer = VertexPos2fColor4b_Buffer.init()

	s.colorVertices = new FixedCapList<VertexPos2fColor4b>(16384)
	s.colorVertices2 = new FixedCapList<VertexPos2fColor4b>(16384)
	s.spriteVertices = new FixedCapList<VertexPos2fTex2fColor4b>(16384)
	s.spriteVertices2 = new FixedCapList<VertexPos2fTex2fColor4b>(16384)
	s.textVertices = new FixedCapList<VertexPos2fTex2fColor4b>(16384)

	sprite := Image(1950, 1200)
	sprite.drawImage(loadPng("runtime_files/cards.png"), 0, 0) // 1950x800
	sprite.drawImage(loadPng("runtime_files/minicard.png"), 0, 800) // 50x66
	sprite.drawImage(loadPng("runtime_files/no_cards.png"), 50, 800) // 50x66
	sprite.drawImage(loadPng("runtime_files/coin.png"), 0, 900) // 17x17
	sprite.drawImage(loadPng("runtime_files/button.png"), 0, 1000) // 120x80
	sprite.drawImage(loadPng("runtime_files/check.png"), 0, 1100) // 24x24
	sprite.drawImage(loadPng("runtime_files/checkbox.png"), 0, 1150) // 120x30
	
	s.spriteTexture = new createTextureFromImage(ref sprite)

	audioSpec := getDefaultAudioSpec()
	s.audioPlayer = AudioPlayer.init(audioSpec)
	audioSpec.callback = pointer_cast(AudioPlayer.callback, pointer)
	audioSpec.userdata = pointer_cast(s.audioPlayer, pointer)
	audioDevice := openAudioDevice(ref audioSpec)

	s.sfx = new SoundEffects{}
	s.sfx.cardPlace1 = new loadWAV("runtime_files/cardPlace1.wav", ref audioDevice.spec)
	s.sfx.cardPlace2 = new loadWAV("runtime_files/cardPlace2.wav", ref audioDevice.spec)
	s.sfx.cardPlace3 = new loadWAV("runtime_files/cardPlace3.wav", ref audioDevice.spec)
	s.sfx.cardPlace4 = new loadWAV("runtime_files/cardPlace4.wav", ref audioDevice.spec)
	s.sfx.cardPlace = new Array<Array<byte>>(4)
	s.sfx.cardPlace[0] = s.sfx.cardPlace1
	s.sfx.cardPlace[1] = s.sfx.cardPlace2
	s.sfx.cardPlace[2] = s.sfx.cardPlace3
	s.sfx.cardPlace[3] = s.sfx.cardPlace4
	s.sfx.charm = new loadWAV("runtime_files/charm.wav", ref audioDevice.spec)
	s.sfx.charm2 = new loadWAV("runtime_files/charm2.wav", ref audioDevice.spec)
	s.sfx.win = new loadWAV("runtime_files/win.wav", ref audioDevice.spec)

	SDL_PauseAudioDevice(audioDevice.id, 0)

	s.widgets = new FixedCapList<Widget>(64)

	s.fpsCounter = new FpsCounter.create()

	s.players = new Array<Player>(4)
	for i := 0; i < s.players.count {
		s.players[i] = new Player { name: new FixedCapList<char>(16) }
	}

	s.hand = new FixedCapList<HandCard>(16)
	s.board = new FixedCapList<Card>(16)
	s.animationCards = new FixedCapList<Card>(16)
	s.numRounds = -1

	s.stopwatchStart = Stopwatch.create()

	s.messageText = new FixedCapList<char>(1024)
	s.messageText.copyString("Connecting to game...")
	s.stage = GameStage.endOfRound

	mainLoop(s, arenaAllocator, ringAllocator)

	Stdout.writeLine("Exiting game")

	SDL_CloseAudioDevice(audioDevice.id)
}

mainLoop(s AppState, arenaAllocator ArenaAllocator, ringAllocator RingAllocator) {
	stateMessages := new FixedCapList<StateMessage>(1024)
	message := Message{}
	events := new FixedCapList<Event>(1024)

	messageBufferPos := 0
	sw_heartbeat := Stopwatch.create()

	t := 0.0
	dt := 0.0

	::currentAllocator = ringAllocator.iAllocator_escaping()

	sw_frame := Stopwatch.create()

	while true {
		while !s.isError {
			if s.hasSendFailed {
				error(s, "Disconnected from game (write error)")
				break
			}

			rr := Connection.tryReceiveMessage(s.ts, ref message, ref messageBufferPos)
			if rr == ReadMessageResult.ok {
				if message.type == MessageType.state {
					stateMessages.add(transmute(message, StateMessage))
					s.screenType = ScreenType.game
				} else if message.type == MessageType.heartBeat {
					break
				} else {
					error(s, "Disconnected from game (bad message)")
					break
				}
			} else if rr == ReadMessageResult.notReady {
				break
			} else {
				error(s, "Disconnected from game (read error)")
				break
			}
		}

		if sw_heartbeat.elapsedSeconds() > 5 {
			sendMessageToServer(s, ref Message { type: MessageType.heartBeat, length: sizeof(Message) })
			sw_heartbeat = Stopwatch.create()
		}

		events.clear()

		e := SDL_Event{}
		while SDL_PollEvent(ref e) != 0 {
			eventType := transmute(e, SDL_Event_Variant0).type
			if eventType == SDL_QUIT {
				return
			} else if eventType == SDL_WINDOWEVENT {
				ee := transmute(e, SDL_WindowEvent)
				if ee.event == cast(SDL_WindowEventID.SDL_WINDOWEVENT_SIZE_CHANGED, uint) {
					s.width = max(1280, ee.data1)
					s.height = max(768, ee.data2)
					s.mouseOffsetY = s.height - ee.data2
				}
			} else if eventType == SDL_KEYDOWN {
				ee := transmute(e, SDL_KeyboardEvent)
				scan := ee.keysym.scancode
				if scan == SDL_Scancode.SDL_SCANCODE_F1 {
					s.isFpsVisible = !s.isFpsVisible					
				} else if scan == SDL_Scancode.SDL_SCANCODE_F11 {
					s.isFullscreen = !s.isFullscreen
					SDL_SetWindowFullscreen(s.windowPtr, s.isFullscreen ? SDL_WINDOW_FULLSCREEN_DESKTOP : 0)
				} else {
					events.add(Event { type: EventType.keyDown, scanCode: scan }) 
				}
			} else if eventType == cast(SDL_EventType.SDL_MOUSEBUTTONDOWN, uint) || eventType == cast(SDL_EventType.SDL_MOUSEBUTTONUP, uint) {
				ee := transmute(e, SDL_MouseButtonEvent)
				if ee.button == SDL_BUTTON_LEFT {
					events.add(Event { type: eventType == cast(SDL_EventType.SDL_MOUSEBUTTONDOWN, uint) ? EventType.mouseDown : EventType.mouseUp, mousePos: IntVector2(ee.x, ee.y + s.mouseOffsetY) }) 
				}
			}
		}

		SDL_GetMouseState(ref s.mouse.x, ref s.mouse.y)
		s.mouse.y += s.mouseOffsetY

		if s.screenType == ScreenType.message {
			MessageScreen.update(s, events, dt)
		} else {
			GameScreen.update(s, stateMessages, events, dt)
		}

		glEnable(GL_BLEND)
		glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA)

		glViewport(0, 0, s.width, s.height)
		glClearColor(0, 0, 0, 0)
		glClear(GL_COLOR_BUFFER_BIT)

		if s.screenType == ScreenType.message {
			MessageScreen.render(s)
		} else {
			GameScreen.render(s)
		}

		glFinish()
		SDL_GL_SwapWindow(s.windowPtr)
		glFinish()

		ticks := sw_frame.elapsedTicks()
		sw_frame.orig += ticks
		dt = cast(ticks * Stopwatch.secondsPerTick, float)
		s.fpsCounter.addSample(dt)
		dt = min(dt, 0.1)
		//dt = 1.0 / 60.0
		t += dt
		
		AllocatorDebugger.pointerScan(arenaAllocator, ringAllocator.from, ringAllocator.to)
		
		//Stdout.writeLine(ringAllocator.debugInfo())
		
		ringAllocator.freeUpToMarker(ringAllocator.current)
	}
}
