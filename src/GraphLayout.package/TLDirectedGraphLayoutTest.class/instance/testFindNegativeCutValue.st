as yet unclassified
testFindNegativeCutValue
	| graph tightTree cutValuesDictionary edgeWithNegativeCutValue |
	graph := self createTelescopeGraphFrom: self graph1.
	tightTree := self tightTreeForGraph1: graph.
	cutValuesDictionary := layout cutValuesForGraph: graph tightTree: tightTree.
	edgeWithNegativeCutValue := layout findNegativeCutValue: cutValuesDictionary.
	self assert: edgeWithNegativeCutValue fromNode entity equals: $g.
	self assert: edgeWithNegativeCutValue toNode entity equals: $h