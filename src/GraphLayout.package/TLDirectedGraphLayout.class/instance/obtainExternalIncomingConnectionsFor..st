accessing
obtainExternalIncomingConnectionsFor: aCollectionOfNodes
	^ aCollectionOfNodes
		flatCollect: [ :aNode | 
			(aNode incomingConnections select: [ :aConnection | (aCollectionOfNodes includes: aConnection fromNode) not ])]