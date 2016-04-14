adjacent
outgoingAdjacentNodes
	^ self realNode outgoingAdjacentNodes collect: [ :node | node generator elementFromTLDrawable: node ]