generation - node
generateCompositeNode: aCompositeNode
	| parent |
	parent := self generateSimpleNode: aCompositeNode.
	aCompositeNode expanded ifTrue: [ self generateAndNestChildrenOf: aCompositeNode ].
	^ parent