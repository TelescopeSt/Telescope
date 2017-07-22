children
allNodesRecursively
	^ (self childrenGroup flatCollect: #allNodesRecursively)
		add: self;
		yourself