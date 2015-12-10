as yet unclassified
testConnectNodeFromAGroup
	| connections  |
	connections := TLSimpleNode new connectFrom: group.
	self assert: connections size equals: 4.