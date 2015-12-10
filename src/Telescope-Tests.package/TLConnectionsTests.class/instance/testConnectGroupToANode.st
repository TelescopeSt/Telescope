as yet unclassified
testConnectGroupToANode
	| connections  |
	connections := group connectTo: TLSimpleNode new.
	self assert: connections size equals: 4.