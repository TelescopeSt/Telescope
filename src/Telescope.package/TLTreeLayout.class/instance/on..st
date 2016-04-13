as yet unclassified
on: aGroup
	| tree yTable |
	tree := self obtainTreesFromNodes: aGroup.
	
	yTable := self obtainYtableForTree: tree.
	
	self positionNodesInTree: tree currentDec: 0.