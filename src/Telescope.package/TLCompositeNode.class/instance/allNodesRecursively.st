children
allNodesRecursively
	| grp |
	grp := self childrenGroup flatCollect: #allNodesRecursively.
	grp add: self.
	^ grp