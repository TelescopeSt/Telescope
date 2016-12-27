action
connectNode: aNode
	1halt.
	self connectionsByNode
		at: aNode
		put:
			(self connectToOrigin value
				ifFalse: [ aNode connectTo: (self context nodesForEntities: (self obtain: self property on: aNode entity)) ]
				ifTrue: [ (self context nodesForEntities: (self obtain: self property on: aNode entity)) connectTo: aNode ]).
	aNode state at: self actionPropertySymbol put: true