as yet unclassified
testOrdering
	| graph1 |
	graph1 := (self createTelescopeGraphFrom: self graph1).
	layout ordering: (layout rankTightTree: (layout rankGraph: graph1) ) 