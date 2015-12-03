commands
removeAllCommands
	| commands |
	commands := self commandsQueue.
	self commandsQueue: OrderedCollection new.
	^ commands