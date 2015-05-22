as yet unclassified
testConnectThroughWithCollection
	| connections connection |
	connections := group connectThrough: [ :each | {each + 1} ] to: [ :each | each + 2 ].
	self assert: connections size equals: 1.
	connection := connections first.
	self assert: connection fromNode entity equals: 1.
	self assert: connection toNode entity equals: 4.
	self assert: connection entity equals: 2.