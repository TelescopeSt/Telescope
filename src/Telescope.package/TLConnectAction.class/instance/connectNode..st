action
connectNode: aNode
	self connectionsByNode
		at: aNode
		put:
			(self connectToOrigin value
				ifFalse: [ aNode connectTo: (self context nodesForEntities: (self property rtValue: aNode entity)) ]
				ifTrue: [ (self context nodesForEntities: (self property rtValue: aNode entity)) connectTo: aNode ]).
	aNode state at: self actionPropertySymbol put: true