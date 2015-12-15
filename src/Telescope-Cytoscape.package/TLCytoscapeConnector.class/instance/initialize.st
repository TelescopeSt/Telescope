initialization
initialize
	super initialize.
	commandsQueue := OrderedCollection new.
	drawablesById :=Dictionary new