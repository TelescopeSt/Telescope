updating - node
updateChildrenOf: aCompositeNode
	super updateChildrenOf: aCompositeNode.
	self
		updateNestOnNode: aCompositeNode
		nestNodes: aCompositeNode childrenGroup