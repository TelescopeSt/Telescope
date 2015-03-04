as yet unclassified
testcutValuesForGraphTightTree
	|  graph tightTree  |
	graph := self createTelescopeGraphFrom: self graph1.
	tightTree := (self tightTreeForGraph1: graph).
	layout cutValuesForGraph: graph tightTree: tightTree