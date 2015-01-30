connect
connectFrom: aTLEntity using: anEdgeBuilder
	self requireUpdateAndLayoutApplication.
	^ aTLEntity connectToNode: self using: anEdgeBuilder