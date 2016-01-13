generation - node
generateCompositeNode: aCompositeNode
	| parent |
	parent := self generateSimpleNode: aCompositeNode.
	(aCompositeNode expanded and: [ aCompositeNode hasChildren ]) ifTrue: [ self define: parent asParentFor: (self generateChildrenOf: aCompositeNode) ].
	^ parent