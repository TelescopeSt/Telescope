as yet unclassified
testObtainTreeFromNodesWithOneNode
	| node trees |
	node := context mock: #root.
	node can receive: #outgoingAdjacentNodes; answers: {}.
	trees := layout obtainTreesFromNodes: {node}.
	self assert: trees size equals: 1.
	self assert: (trees at: node) isEmpty