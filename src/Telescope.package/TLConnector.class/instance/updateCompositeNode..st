updating - node
updateCompositeNode: aNode
	aNode isUpdateRequired
		ifTrue: [ 
			self updateSimpleNode: aNode.
			aNode expanded
				ifTrue: [ self updateChildrenOf: aNode ]
				ifFalse: [ self removeChildrenAndResize: aNode ] ]