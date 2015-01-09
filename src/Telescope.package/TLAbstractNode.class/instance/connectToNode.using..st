connect
connectToNode: aTLNode using: anEdgeBuilder
	^ TLConnection from: self to: aTLNode edgeBuilder: anEdgeBuilder visualization: self visualization 