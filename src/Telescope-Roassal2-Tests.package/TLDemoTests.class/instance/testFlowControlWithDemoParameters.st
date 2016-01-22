tests
testFlowControlWithDemoParameters
	| flowControl |
	flowControl := TLDemos exampleFLowControl.
	self assert: flowControl subGroups size equals: 3.
	self assert: (flowControl > 1) nodes size equals: 1.
	self assert: (flowControl > 2) nodes size equals: 3.
	self assert: (flowControl > 3) nodes size equals: 3.
	self assert: ((flowControl > 1) nodes first outgoingConnections collect: #toNode) equals: (flowControl > 2) nodes.
	flowControl close
	