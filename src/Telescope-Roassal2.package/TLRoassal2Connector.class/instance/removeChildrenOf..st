removing - node
removeChildrenOf: aCompositeNode
	super removeChildrenOf: aCompositeNode.
	self onNode: aCompositeNode nestNodes: #().