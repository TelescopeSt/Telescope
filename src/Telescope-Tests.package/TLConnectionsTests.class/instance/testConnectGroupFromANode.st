as yet unclassified
testConnectGroupFromANode
	| connections  |
	connections := group connectFrom: TLSimpleNode new.
	self assert: connections size equals: 4.