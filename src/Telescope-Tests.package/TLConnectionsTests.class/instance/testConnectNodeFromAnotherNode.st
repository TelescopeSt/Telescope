tests
testConnectNodeFromAnotherNode
	| connection  nodeA nodeB |
	nodeA := TLSimpleNode withEntity: $a.
	nodeB := TLSimpleNode withEntity: $b.
	connection := nodeB connectFrom: nodeA.
	self assert: connection fromNode equals: nodeA.
	self assert: connection toNode equals: nodeB.
	