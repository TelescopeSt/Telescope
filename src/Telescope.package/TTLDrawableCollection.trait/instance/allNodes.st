accessing
allNodes
	^ self nodes, (self subGroups flatCollect: #nodes)