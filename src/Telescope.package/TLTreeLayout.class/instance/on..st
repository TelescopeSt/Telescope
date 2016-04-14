placing
on: aGroup
	| tree yTable |
	tree := self obtainTreesFromNodes: aGroup.
	yTable := self obtainYtableForTree: tree.
	self
		positionNodesInTree: tree
		yDec: yTable
		level: 1
		xStart: 0