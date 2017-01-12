tests
testObtainNodesFromVisualization
	| visu |
	visu := TLVisualization new.
	visu addNodesFromEntities: (1 to: 3).
	self assert: visu obtain nodes size equals: 3