action
regularActionOn: aNode
	self connectionsByNode
		at: aNode
		put:
			((self obtain: self connectToOrigin on: aNode entity)
				ifFalse: [ aNode connectTo: (self obtainsNodesToConnectAt: aNode) ]
				ifTrue: [ (self obtainsNodesToConnectAt: aNode) connectTo: aNode ]).
	self connectionStyle ifNotNil: [ (self connectionsByNode at: aNode) do: [ :c | c addStyle: self connectionStyle ] ]