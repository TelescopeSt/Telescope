tests
testConnectIfNotNodeToAGroup
	| connections node |
	node := TLSimpleNode new.
	connections := node connectIfNotTo: group.
	self assert: connections size equals: 4.
	self assert: connections asArray equals: (node connectIfNotTo: group) asArray.
	self assert: node outgoingConnections size equals: 4
	