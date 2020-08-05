Suit enum {
	diamonds
	clubs
	hearts
	spades
}

Card struct {
	suit Suit
	rank int // 2 - 14

	:ace = 14
	
	fromByte(b byte) {
		si := b >> 4
		assert(0 <= si && si < 4)
		rank := b & 0xf
		assert(2 <= rank && rank <= 14)
		return Card { suit: cast(si, Suit), rank: rank }
	}

	toByte(c Card) {
		return cast(cast(c.suit, uint) << 4 | cast(c.rank, uint), byte)
	}

	toString(c Card) {
		return format("{}{}", "23456789TJQKA"[c.rank - 2], "dchs"[cast(c.suit, uint)])
	}

	hash(c Card) uint {
		return toByte(c)
	}

	equals(a Card, b Card) {
		return a.suit == b.suit && a.rank == b.rank
	}

	compare(a Card, b Card) {
		return int.compare(Rules.scoreCard(a), Rules.scoreCard(b))
	}
}

cardsToString(cards Array<Card>) {
	rb := StringBuilder{}
	insertSep := false
	for c in cards {
		if insertSep {
			rb.write(" ")
		} else {
			insertSep = true
		}
		rb.write(c.toString())
	}
	return rb.compactToString()
}

MoveKind enum {
	none
	straight = 1
	flush = 2
	fullHouse = 3
	quads = 4
	straightFlush = 5
}

MoveScore struct {
	score int
	kind MoveKind
}

Rules {
	scoreCard(c Card) {
		return (c.rank > 2 ? c.rank * 4 : 60) + cast(cast(c.suit, uint), int)
	}

	hasBetterCard(cards Array<Card>, c Card) {
		score := scoreCard(c)
		for cc in cards {
			if scoreCard(cc) > score {
				return true
			}
		}
		return false
	}

	scoreMove2(a Card, b Card) {
		if a.rank == b.rank {
			return max(scoreCard(a), scoreCard(b))
		}
		return 0
	}

	scoreMove3(a Card, b Card, c Card) {
		if a.rank == b.rank && b.rank == c.rank {
			return max(scoreCard(a), max(scoreCard(b), scoreCard(c)))
		}
		return 0
	}

	scoreMove5(a Card, b Card, c Card, d Card, e Card) {
		isFlush := a.suit == b.suit && a.suit == c.suit && a.suit == d.suit && a.suit == e.suit

		// Straight (+ straight flush)
		straightScore := -1
		if b.rank == a.rank + 1 && c.rank == a.rank + 2 && d.rank == a.rank + 3 && e.rank == a.rank + 4 {
			straightScore = 100
		} else if a.rank == 3 && b.rank == 4 && c.rank == 5 && d.rank == 6 && e.rank == 2 {
			straightScore = 100 // Straight 2,3,4,5,6
		} else if a.rank == 3 && b.rank == 4 && c.rank == 5 && d.rank == Card.ace && e.rank == 2 {
			straightScore = 100 // Straight A,2,3,4,5
		}

		if straightScore >= 0 {
			return MoveScore { score: (isFlush ? 600 : 0) + straightScore + scoreCard(e), kind: isFlush ? MoveKind.straightFlush : MoveKind.straight }
		}

		// Flush
		if isFlush {
			return MoveScore { score: 300 + scoreCard(e), kind: MoveKind.flush }
		}

		// Full house
		if a.rank == b.rank && a.rank == c.rank && d.rank == e.rank {
			return MoveScore { score: 400 + scoreMove3(a, b, c), kind: MoveKind.fullHouse }
		} else if a.rank == b.rank && c.rank == d.rank && c.rank == e.rank {
			return MoveScore { score: 400 + scoreMove3(c, d, e), kind: MoveKind.fullHouse }
		}

		// Quads
		if (a.rank == b.rank && a.rank == c.rank && a.rank == d.rank) ||
			(a.rank == b.rank && a.rank == c.rank && a.rank == e.rank) ||
			(a.rank == b.rank && a.rank == d.rank && a.rank == e.rank) ||
			(a.rank == c.rank && a.rank == d.rank && a.rank == e.rank) {
			return MoveScore { score: 500 + scoreCard(a), kind: MoveKind.quads }
		}
		if b.rank == c.rank && b.rank == d.rank && b.rank == e.rank {
			return MoveScore { score: 500 + scoreCard(b), kind: MoveKind.quads }
		}

		return MoveScore{}
	}

	scoreMove5_(m Array<Card>) {
		return scoreMove5(m[0], m[1], m[2], m[3], m[4])
	}

	scoreMove(m Array<Card>) {
		if m.count == 1 {
			return scoreCard(m[0])
		} else if m.count == 2 {
			return scoreMove2(m[0], m[1])
		} else if m.count == 3 {
			return scoreMove3(m[0], m[1], m[2])
		} else if m.count == 5 {
			return scoreMove5_(m).score
		} else {
			return 0
		}
	}

	scoreHand(remain int) {		
		if remain < 10 {
			return remain
		} else if remain < 13 {
			return remain * 2
		} else {
			return remain * 3
		}
	}

	findPossibleMove(hand Array<Card>, board Array<Card>) {
		if board.count == 0 {
			move := Array<Card>(1)
			move[0] = hand[0]
			return move
		} else {
			bs := scoreMove(board)
			if board.count == 1 {
				for c in hand {
					if scoreCard(c) > bs {
						move := Array<Card>(1)
						move[0] = c
						return move
					}
				}
			} else if board.count == 2 || board.count == 3 {
				countByRank := Map.create<int, int>()
				for c in hand {
					count := countByRank.getOrDefault(c.rank)
					countByRank.addOrUpdate(c.rank, count + 1)
				}
				for e in countByRank {
					if e.value >= board.count {
						move := new List<Card>{}
						for c in hand {
							if c.rank == e.key {
								move.add(c)
								if move.count == board.count {
									if scoreMove2(move[0], move[1]) > bs {
										return move.asArray()
									}
								}
							}
						}
					}
				}
			} else if board.count == 5 {
				// TODO
			}
		}
		return Array<Card>{}
	}

	sortCardsForDisplay(cs Array<Card>) {
		if cs.count == 5 {
			mv := Rules.scoreMove5(cs[0], cs[1], cs[2], cs[3], cs[4])
			if (mv.kind == MoveKind.straight || mv.kind == MoveKind.straightFlush) && cs[4].rank == 2 {
				result := new Array<Card>(cs.count)
				cs.copySlice(0, cs.count, result, 0)
				result.stableSort(compareStraightOrder)
				return result
			}
		}
		return cs
	}

	compareStraightOrder(a Card, b Card) {
		return int.compare(a.rank != Card.ace ? a.rank : 1, b.rank != Card.ace ? b.rank : 1)
	}

	isValidHand(hand Array<Card>) {
		// One of each rank: invalid
		if (hand[0].rank == 3 && hand[1].rank == 4 && hand[2].rank == 5 && hand[3].rank == 6 && hand[4].rank == 7 && hand[5].rank == 8 &&
			hand[6].rank == 9 && hand[7].rank == 10 && hand[8].rank == 11 && hand[9].rank == 12 && hand[10].rank == 13 && hand[11].rank == 14 && hand[12].rank == 2) {
			return false
		}

		// No cards above 10: invalid
		anyPoints := false
		for h in hand {
			anyPoints = anyPoints || h.rank >= 11 || h.rank == 2
		}

		if !anyPoints {
			return false
		}

		return true
	}

	containsCard(cards Array<Card>, card Card) {
		for c in cards {
			if c == card {
				return true
			}
		}
		return false
	}

	isEndOfCycleMove(move Array<Card>) {
		return (move.count == 1 || move.count == 2 || move.count == 3) && containsCard(move, Card { suit: Suit.spades, rank: 2 })
	}

	moveKindToString(kind MoveKind) {
		if kind == MoveKind.straight {
			return "Straight"
		} else if kind == MoveKind.flush {
			return "Flush"
		} else if kind == MoveKind.fullHouse {
			return "Full House"
		} else if kind == MoveKind.quads {
			return "Quads"
		} else if kind == MoveKind.straightFlush {
			return "Straight Flush"
		}
		return ""
	}

	isValidMove(board Array<Card>, move Array<Card>) {
		if board.count > 0 {
			return move.count == board.count && Rules.scoreMove(move) > Rules.scoreMove(board)
		} else {
			return Rules.scoreMove(move) > 0
		}
	}

	containsSubset(cards Array<Card>, subset Array<Card>) {
		for c in subset {
			if !containsCard(cards, c) {
				return false
			}
		}
		return true
	}

	containsDuplicates(cards Array<Card>) {
		for i := 0; i < cards.count {
			for j := i + 1; j < cards.count {
				if cards[i] == cards[j] {
					return true
				}
			}
		}
		return false
	}
}
