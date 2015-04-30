accessing
adjacentNodes
	^ (self incomingConnections collect: #fromNode) , (self outgoingConnections collect: #toNode)