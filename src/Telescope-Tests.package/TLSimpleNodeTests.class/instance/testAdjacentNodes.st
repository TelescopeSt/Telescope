as yet unclassified
testAdjacentNodes
	| nodeFrom nodeTo edgeBuilder |
	edgeBuilder := protocol mock: 'edgeBuilder'.

	node edgeBuilder: edgeBuilder.
	nodeFrom := TLSimpleNode new edgeBuilder: edgeBuilder; yourself.
	nodeTo := TLSimpleNode new "shape: shape".
	nodeFrom connectTo: node.
	node connectTo: nodeTo.
	self assert: node adjacentNodes asSet equals: { nodeFrom . nodeTo } asSet