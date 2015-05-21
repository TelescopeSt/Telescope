generation - node
generateAndNestChildrenOf: aCompositeNode
	aCompositeNode childrenGroup generate.
	self onNode: aCompositeNode nestNodes: aCompositeNode childrenGroup