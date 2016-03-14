tests
testConnectNodeToAnotherNode
	| connection  nodeA nodeB |
	nodeA := TLSimpleNode withEntity: $a.
	nodeB := TLSimpleNode withEntity: $b.
	connection := nodeA connectTo: nodeB.
	self assert: connection fromNode equals: nodeA.
	self assert: connection toNode equals: nodeB.
	