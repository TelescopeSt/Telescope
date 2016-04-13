as yet unclassified
obtainYtableForTree: tree

	| maxHeightByLevel |
	maxHeightByLevel := OrderedCollection new.
	self calculateMaxForLevel: 1 forTree: tree inTable: maxHeightByLevel.
	^ maxHeightByLevel 