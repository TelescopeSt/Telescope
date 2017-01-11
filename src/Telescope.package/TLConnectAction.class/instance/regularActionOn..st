action
regularActionOn: aNode
	self connectionsByNode
		at: aNode
		put:
			((self obtain: self connectToOrigin on: aNode entity)
				ifFalse: [ aNode connectTo: (self context nodesForEntities: (self obtain: self property on: aNode entity)) ]
				ifTrue: [ (self context nodesForEntities: (self obtain: self property on: aNode entity)) connectTo: aNode ]).
	self connectionStyle ifNotNil: [ (self connectionsByNode at: aNode) do: [ :c | c addStyle: self connectionStyle ] ]