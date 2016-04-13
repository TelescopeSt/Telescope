as yet unclassified
testObtainTreeFromNodesWithOneNode
	| node trees |
	node := Mock named: #root.
	node stub outgoingAdjacentNodes willReturn: {}.
	trees := layout obtainTreesFromNodes: {node}.
	self assert: trees size equals: 1.
	self assert: (trees at: node) isEmpty