generation - node
generateCompositeNode: aCompositeNode
	| parent |
	parent := self generateSimpleNode: aCompositeNode.
	(aCompositeNode expanded and: [ aCompositeNode hasChildren ]) ifTrue: [ self generateChildrenOf: aCompositeNode ].
	^ parent