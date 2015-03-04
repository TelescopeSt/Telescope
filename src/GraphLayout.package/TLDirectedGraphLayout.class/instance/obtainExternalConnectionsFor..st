accessing
obtainExternalConnectionsFor: tightTree
	^ tightTree
		flatCollect: [ :aNode | 
			(aNode incomingConnections select: [ :aConnection | (tightTree includes: aConnection fromNode) not ])
				, (aNode outgoingConnections select: [ :aConnection | (tightTree includes: aConnection toNode) not ]) ]