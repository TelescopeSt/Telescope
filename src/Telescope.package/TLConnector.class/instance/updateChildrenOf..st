updating - node
updateChildrenOf: aCompositeNode
	[ aCompositeNode childrenGroup update ]
		on: KeyNotFound
		do: [ ^ self generateChildrenOf: aCompositeNode ].