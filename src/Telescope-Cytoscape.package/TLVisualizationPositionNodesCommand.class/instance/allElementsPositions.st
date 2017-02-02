as yet unclassified
allElementsPositions
	"ensure that positions of nodes are refresh before the position of triggers"

	| positions |
	positions := self nodes
		reject: #hasChildren
		thenCollect: [ :aNode | 
			aNode nodeId asString
				->
					{(#x -> aNode cytoscapePosition x).
					(#y -> aNode cytoscapePosition y)} asDictionary ].
	self triggers
		do: [ :aTrigger | 
			aTrigger nodeId asString
				->
					{(#x -> aTrigger cytoscapePosition x).
					(#y -> aTrigger cytoscapePosition y)} asDictionary ].
	^ positions