enumerating
allNodesRecursivelyDo: aBlock
	self nodesDo: aBlock.
	self subGroups
		ifNotEmpty: [ :aSubGroup | aSubGroup allNodesRecursivelyDo: aBlock ]