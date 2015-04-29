action
connectNode: aNode
	self connectionsByNode
		at: aNode
		put: (aNode connectTo: (self context nodesForEntities: (self property rtValue: aNode entity ))).
	aNode state at: self actionPropertySymbol put: true