tests
testFlowControlWithDemoParameters
	| flowControl |
	flowControl := TLDemos exampleFLowControl.
	self assert: flowControl subGroups size equals: 3.
	self assert: (flowControl > 0) nodes size equals: 1.
	self assert: (flowControl > 1) nodes size equals: 3.
	self assert: (flowControl > 2) nodes size equals: 3.
	self assert: ((flowControl > 0) nodes first outgoingConnections collect: #toNode) equals: (flowControl > 1) nodes.
	flowControl close
	