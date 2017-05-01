tests
testObtainTreeFromNodesWithThreeNodesInTwoBranches
	| node trees root child |
	child := context mock: 'child'.
	child can
		receive: #outgoingAdjacentNodes;
		answers: {}.
	root := context mock: #root.
	root can
		receive: #outgoingAdjacentNodes;
		answers: {child}.
	node := context mock: 'node'.
	node can
		receive: #outgoingAdjacentNodes;
		answers: {}.
	trees := layout
		obtainTreesFromNodes:
			{root.
			node.
			child}.
	self assert: trees size equals: 2.
	self assert: (trees at: root) size equals: 1.
	self assert: ((trees at: root) at: child) isEmpty.
	self assert: (trees at: node) isEmpty