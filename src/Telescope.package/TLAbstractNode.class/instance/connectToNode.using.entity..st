connect
connectToNode: aTLNode using: anEdgeBuilder entity: anObject
	^ (TLConnectionWithEntity
		from: self
		to: aTLNode
		edgeBuilder: anEdgeBuilder
		visualization: self visualization)
		entity: anObject;
		yourself