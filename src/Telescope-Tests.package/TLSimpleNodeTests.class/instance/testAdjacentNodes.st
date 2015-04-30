as yet unclassified
testAdjacentNodes
	| nodeFrom nodeTo edgeBuilder shape |
	edgeBuilder := protocol mock: 'edgeBuilder'.
	shape := protocol mock: 'shape'.
	protocol describe allow: shape recv: #updateWithDrawable:. 
	protocol describe .
	node edgeBuilder: edgeBuilder; shape: shape.
	nodeFrom := TLSimpleNode new edgeBuilder: edgeBuilder; shape: shape; yourself.
	nodeTo := TLSimpleNode new shape: shape.
	nodeFrom connectTo: node.
	node connectTo: nodeTo.
	self assert: node adjacentNodes asSet equals: { nodeFrom . nodeTo } asSet