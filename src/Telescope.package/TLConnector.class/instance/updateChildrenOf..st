updating - node
updateChildrenOf: aCompositeNode
	[ aCompositeNode childrenGroup update ]
		on: KeyNotFound
		do: [ ^ self generateAndNestChildrenOf: aCompositeNode ].
	self
		updateNestOnNode: aCompositeNode
		nestNodes: aCompositeNode childrenGroup