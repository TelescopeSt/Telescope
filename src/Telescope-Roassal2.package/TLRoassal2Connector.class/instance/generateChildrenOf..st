generation - node
generateChildrenOf: aCompositeNode
	| children |
	children := super generateChildrenOf: aCompositeNode.
	self onNode: aCompositeNode nestNodes: aCompositeNode childrenGroup.
	^ children