commands
removeAllCommands
	| commands |
	positionNodesCommand ifNotNil: [ self addCommand: self positionNodesCommand ].
	commands := self commandsQueue.
	positionNodesCommand := nil.
	self commandsQueue: OrderedCollection new.
	^ commands