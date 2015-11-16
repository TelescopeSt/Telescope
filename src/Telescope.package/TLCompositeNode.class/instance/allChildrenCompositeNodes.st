children
allChildrenCompositeNodes
	|allChildrenCompositeNodes|
	allChildrenCompositeNodes := {self}, self childrenNodes select: [:each | each class = TLCompositeNode].
	^ (allChildrenCompositeNodes, (self childrenNodes flatCollect: #allChildrenCompositeNodes))