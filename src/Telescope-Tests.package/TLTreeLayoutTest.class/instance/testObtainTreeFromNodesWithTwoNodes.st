as yet unclassified
testObtainTreeFromNodesWithTwoNodes
	| node trees root |
	node := Mock named: 'child'.
	node stub outgoingAdjacentNodes willReturn: {}.
	root := Mock named: #root.
	root stub outgoingAdjacentNodes willReturn: {node}.
	trees := layout obtainTreesFromNodes: {root . node}.
	self assert: trees size equals: 1.
	self assert: (trees at: root) size equals: 1.
	self assert: ((trees at: root) at: node) isEmpty