generation - node
generateChildrenOf: aCompositeNode
	super generateChildrenOf: aCompositeNode.
	self onNode: aCompositeNode nestNodes: aCompositeNode childrenGroup