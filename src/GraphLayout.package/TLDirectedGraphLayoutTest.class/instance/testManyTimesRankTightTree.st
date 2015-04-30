as yet unclassified
testManyTimesRankTightTree
	| graph1 result result2 |
	result := nil.
	
	100 timesRepeat: [ 
	graph1 := (self createTelescopeGraphFrom: self graph1).
	result2 := (layout rankTightTree: (layout rankGraph: graph1)).
	result ifNotNil: [self assert: result equals: result2].
	result := result2.]