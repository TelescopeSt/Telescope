accessing
ordering: aRankedGraph
	"input: aDictionary of Set of nodes by rank (the result of self rankTightTree: (self rankGraph: aGraph) )"

	"A technique for Drawing Directed Graph page 14"

	| order best |
	order := self initOrder: aRankedGraph.
	
	best := order.
	1 to: 24 do: [ :i | 
		self wmedian: order fromBottom: i odd.
		order := self transpose: order.
		(self crossing: order) < (self crossing: best)
			ifTrue: [ best = order ] ].
	^ best