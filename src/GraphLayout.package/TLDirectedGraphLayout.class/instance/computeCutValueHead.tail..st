accessing
computeCutValueHead: head tail: tail
	^ ((head flatCollect: #outgoingConnections) select: [ :aConnection | tail includes: aConnection toNode ]) size
		- ((head flatCollect: #incomingConnections) select: [ :aConnection | tail includes: aConnection fromNode ]) size