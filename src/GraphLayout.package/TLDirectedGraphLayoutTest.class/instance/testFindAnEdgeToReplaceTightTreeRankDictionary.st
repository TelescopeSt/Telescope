as yet unclassified
testFindAnEdgeToReplaceTightTreeRankDictionary
	| graph tightTree cutValuesDictionary edgeWithNegativeCutValue rankDictionary replacementEdge |
	graph := self createTelescopeGraphFrom: self graph1.
	tightTree := self tightTreeForGraph1: graph.
	rankDictionary := layout initRank: graph.
	cutValuesDictionary := layout cutValuesForGraph: graph tightTree: tightTree.
	edgeWithNegativeCutValue := layout findNegativeCutValue: cutValuesDictionary.
	replacementEdge := (layout findAnEdgeToReplace: edgeWithNegativeCutValue tightTree: tightTree rankDictionary: rankDictionary).
	self assert: replacementEdge fromNode entity equals: $a.
	self assert: replacementEdge toNode entity equals: $e