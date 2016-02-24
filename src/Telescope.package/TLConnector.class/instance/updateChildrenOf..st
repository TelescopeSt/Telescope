updating - node
updateChildrenOf: aCompositeNode
	[ aCompositeNode childrenGroup update ]
		on: KeyNotFound
		do: [ self define: (self elementFromTLDrawable: aCompositeNode) asParentFor: (self generateChildrenOf: aCompositeNode) ]