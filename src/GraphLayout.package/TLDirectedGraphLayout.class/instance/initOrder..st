accessing
initOrder: aRankedGraph
	| resultNodes |
	resultNodes := OrderedCollection new.
	aRankedGraph do: [ :aRankCollection | resultNodes add: (aRankCollection flatCollect: [ :aNode | aNode outgoingConnections collect: #toNode ] as: OrderedCollection) ].
	^ resultNodes 