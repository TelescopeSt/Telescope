tests
testAdjacentNodes
	| nodeFrom nodeTo edgeBuilder |
	edgeBuilder := protocol mock: 'edgeBuilder'.

	nodeFrom := TLSimpleNode new.
	nodeTo := TLSimpleNode new "shape: shape".
	nodeFrom connectTo: node.
	node connectTo: nodeTo.
	self assert: node adjacentNodes asSet equals: { nodeFrom . nodeTo } asSet