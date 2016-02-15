enumerating
allLeafNodes
	^ self nodes, self subGroups flatCollect: #allLeafNodes