as yet unclassified
removeAllCommands
	| commands |
	self addingCommand ifNotEmpty: [ self removingCustomizingCommands addLast: self addingCommand ].
	self positionNodesCommand ifNotEmpty: [ self removingCustomizingCommands addLast: self positionNodesCommand ].
	commands := self removingCustomizingCommands.
	self clear.
	^ commands