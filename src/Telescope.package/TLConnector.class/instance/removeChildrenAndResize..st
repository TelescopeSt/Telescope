removing - node
removeChildrenAndResize: aCompositeNode
	aCompositeNode childrenGroup removeWith: self.
	self onNode: aCompositeNode nestNodes: #().