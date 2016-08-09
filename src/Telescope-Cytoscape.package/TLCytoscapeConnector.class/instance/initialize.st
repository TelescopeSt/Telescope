initialization
initialize
	super initialize.
	commandsQueue := TLCommandsQueue new.
	drawablesById := Dictionary new.
	movedNodesRelativePositionByElement := Dictionary new