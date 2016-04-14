as yet unclassified
allNodesRecursivelyDo: aBlock
	self nodesDo: aBlock.
	self subGroups ifNotEmptyDo: [ :aSubGroup | aSubGroup allNodesRecursivelyDo: aBlock ]