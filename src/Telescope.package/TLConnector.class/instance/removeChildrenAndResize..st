removing - node
removeChildrenAndResize: aCompositeNode
	aCompositeNode childrenNodes removeWith: self.
	self onNode: aCompositeNode nestNodes: #().