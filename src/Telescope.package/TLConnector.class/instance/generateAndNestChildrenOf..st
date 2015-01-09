generation - node
generateAndNestChildrenOf: aCompositeNode
	aCompositeNode childrenNodes generate.
	self onNode: aCompositeNode nestNodes: aCompositeNode childrenNodes telescopeEntities