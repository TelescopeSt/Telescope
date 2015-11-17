tests
testStrategyDefiningStyleForNode
	| node |
	strategy nodeStyle: #myStyle.
	node := strategy createNodeFromEntity: #whatever.
	self assert: node styles equals: {#node . #myStyle} asOrderedCollection