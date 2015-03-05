as yet unclassified
testFindRootNodesFromTightTreeAfterRanking
	| graph1 |
	graph1 := (self createTelescopeGraphFrom: self graph1).
	self assert: (layout findRootNodesFromTightTree: (layout rankGraph: graph1)) equals: {graph1 nodeForEntity: $a} asSet