updating - node
updateChildrenOf: aCompositeNode
	[ aCompositeNode childrenNodes update ]
		on: KeyNotFound
		do: [ ^ self generateAndNestChildrenOf: aCompositeNode ].
	self
		updateNestOnNode: aCompositeNode
		nestNodes: aCompositeNode childrenNodes