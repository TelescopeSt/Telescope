as yet unclassified
testConnectNodeToAGroup
	| connections  |
	connections := TLSimpleNode new connectTo: group.
	self assert: connections size equals: 4.