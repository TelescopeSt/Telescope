connect
connectIfNotToNode: aTLNode
	^ self outgoingConnections detect: [ :aConnection | aConnection toNode = aTLNode ] ifNone: [ self connectTo: aTLNode ]