Args struct {
	name string
	host bool
	join string
	joinAddress SOCKADDR_IN
	numAI int
	port ushort
	rounds int
	noArgs bool
	hostOnly bool
	log bool
}

parseArgs(parser CommandLineArgsParser) {
	args := Args {}

	token := parser.readToken()

	if token == "" {
		args.noArgs = true
		return args
	}
	
	while token != "" {
		if token == "-name" {
			args.name = parseString(parser, "name")
		} else if token == "-host" {
			if args.join == "" {
				args.host = true
			} else {
				parser.error("-host cannot be used with -join")
			}
		} else if token == "-join" {
			if !args.host {
				args.join = parseString(parser, "address")			
				addr := tryConvertStringToAddress(args.join)
				if addr.hasValue {
					args.joinAddress = addr.value
				} else {
					parser.error("Invalid address")
				}
			} else {
				parser.error("-join cannot be used with -host")
			}
		} else if token == "-port" {
			if args.host {
				port := parseInt(parser, "number")
				if port.hasValue {
					if 0 < port.value && port.value <= ushort.maxValue {
						args.port = checked_cast(port.value, ushort)
					} else {
						parser.error("Invalid port")
					}
				}
			} else {
				parser.error("-port can only be used with -host")
			}
		} else if token == "-rounds" {
			if args.host {
				rounds := parseInt(parser, "number")
				if rounds.hasValue {
					if 1 <= rounds.value && rounds.value <= int.maxValue {
						args.rounds = rounds.value
					} else {
						parser.error("Invalid number of rounds")
					}
				}
			} else {
				parser.error("-rounds can only be used with -host")
			}
		} else if token == "-ai" {
			numAI := parseInt(parser, "number")
			if numAI.hasValue {
				args.numAI = numAI.value
			}
		} else if token == "-hostonly" {
			if args.host {
				args.hostOnly = true
			} else {
				parser.error("-hostonly can only be used with -host")
			}
		} else if token == "-log" {
			if args.host {
				args.log = true
			} else {
				parser.error("-log can only be used with -host")
			}
		} else {
			parser.error(format("Invalid flag: {}", token))
		}
		token = parser.readToken()
	}

	if args.join == "" && args.host == false {
		parser.expected("-join [address], or: -host")
	} else if args.name == "" && !args.hostOnly {
		parser.expected("-name [yourname]")
	}

	return args
}

parseString(parser CommandLineArgsParser, desc string) {
	token := parser.readToken()
	if token == "" {
		parser.expected(desc)
	}
	return token
}

parseInt(parser CommandLineArgsParser, desc string) {
	token := parser.readToken()
	if token == "" {
		parser.expected(desc)
		return Maybe<int>{}
	}
	val := int.tryParse(token)
	if !val.hasValue {
		parser.error("Expected: number")
	}
	return val
}

parseULong(parser CommandLineArgsParser) {
	token := parser.readToken()
	return ulong.tryParse(token).unwrap()
}
