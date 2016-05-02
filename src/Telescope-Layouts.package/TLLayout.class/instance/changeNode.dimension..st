as yet unclassified
changeNode: aNode dimension: aNewDimension
	aNode dimension: (self obtainsDimension: aNewDimension forAngle: self angle negated).
	TLNodeDimensionChanged signalForNode: aNode.