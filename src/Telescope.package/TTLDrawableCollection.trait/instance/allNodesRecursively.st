enumerating
allNodesRecursively
	^ (self nodes flatCollect: #allNodesRecursively), (self subGroups flatCollect: #allNodesRecursively)