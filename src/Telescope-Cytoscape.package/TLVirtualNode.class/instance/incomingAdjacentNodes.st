adjacent
incomingAdjacentNodes
	^ self realNode incomingAdjacentNodes collect: [ :node | node generator elementFromTLDrawable: node ]