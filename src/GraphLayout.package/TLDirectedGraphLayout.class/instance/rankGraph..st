accessing
rankGraph: aGraph
	| ranks tightTree cutValues |
	ranks := self initRank: aGraph.
	tightTree := self tightTreeFor: aGraph ranks: ranks.
	cutValues := self cutValuesForGraph: aGraph tightTree: tightTree.
	[ 
	[ 
	| edgeToRemove |
	edgeToRemove := self findNegativeCutValue: cutValues.
	tightTree add: (self findAnEdgeToReplace: edgeToRemove tightTree: tightTree rankDictionary: ranks).
	tightTree remove: edgeToRemove.
	cutValues := self cutValuesForGraph: aGraph tightTree: tightTree ] repeat ]
		on: NotFound
		do: [ 
			"no more negative cut value"
			 ].
	^ tightTree 