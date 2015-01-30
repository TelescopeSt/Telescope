connect
connectTo: aTLEntity using: anEdgeBuilder
	self requireUpdateAndLayoutApplication.
	^ aTLEntity connectFromNode: self using: anEdgeBuilder