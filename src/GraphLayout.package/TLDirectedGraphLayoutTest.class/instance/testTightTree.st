as yet unclassified
testTightTree
	| rankDictionary graph tightTreeConnections|
	graph := self createTelescopeGraphFrom: self graph1.
	rankDictionary := layout initRank: graph.
	tightTreeConnections:= (layout tightTreeFor: graph ranks: rankDictionary).
	self assert: tightTreeConnections size equals: graph nodes size - 1