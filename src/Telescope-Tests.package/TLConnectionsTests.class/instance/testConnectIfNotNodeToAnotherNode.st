tests
testConnectIfNotNodeToAnotherNode
	| connection nodeA nodeB |
	nodeA := TLSimpleNode withEntity: $a.
	nodeB := TLSimpleNode withEntity: $b.
	connection := nodeA connectIfNotTo: nodeB.
	self assert: connection fromNode equals: nodeA.
	self assert: connection toNode equals: nodeB.
	self assert: connection equals: (nodeA connectIfNotTo: nodeB).
	self assert: nodeA outgoingConnections size equals: 1