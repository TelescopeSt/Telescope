enumerating
allNodesRecursively
	^ self nodes, self subGroups flatCollect: #allNodesRecursively