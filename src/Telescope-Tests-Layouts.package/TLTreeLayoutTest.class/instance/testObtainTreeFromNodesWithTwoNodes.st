tests
testObtainTreeFromNodesWithTwoNodes
	| node trees root |
	node := context mock: 'child'.
	node can
		receive: #outgoingAdjacentNodes;
		answers: {}.
	root := context mock: #root.
	root can
		receive: #outgoingAdjacentNodes;
		answers: {node}.
	trees := layout
		obtainTreesFromNodes:
			{root.
			node}.
	self assert: trees size equals: 1.
	self assert: (trees at: root) size equals: 1.
	self assert: ((trees at: root) at: node) isEmpty