tests
testRemovedNodeHasNoConnection
	| node |
	visualization > #one addNodesFromEntities: (1 to: 4).
	node := visualization > #two addNodeFromEntity: 5.
	visualization > #three addNodesFromEntities: (6 to: 10).
	visualization > #one connectTo: visualization > #two.
	visualization > #two connectTo: visualization > #three.
	(visualization > #two)  removeAll.
	self assert: node allConnections isEmpty.
	(visualization > #one) do: [ :aNode | self assert: aNode allConnections isEmpty ].
	(visualization > #three) do: [ :aNode | self assert: aNode allConnections isEmpty ]