as yet unclassified
testRankTightTree
	| graph1 |
	graph1 := (self createTelescopeGraphFrom: self graph1).
	(layout rankTightTree: (layout rankGraph: graph1)) inspect