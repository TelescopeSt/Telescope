as yet unclassified
testObtainTreeFromNodesWithThreeNodesInTwoBranches
	| node trees root child |
	child := Mock named: 'child'.
	child stub outgoingAdjacentNodes willReturn: {}.
	root := Mock named: #root.
	root stub outgoingAdjacentNodes willReturn: {child}.
	node := Mock named: 'node'.
	node stub outgoingAdjacentNodes willReturn: {}.
	trees := layout
		obtainTreesFromNodes:
			{root.
			node.
			child}.
	self assert: trees size equals: 2.
	self assert: (trees at: root) size equals: 1.
	self assert: ((trees at: root) at: child) isEmpty.
	self assert: (trees at: node) isEmpty