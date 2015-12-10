connect
connectToNode: aTLNode entity: anObject
	^ (TLConnectionWithEntity
		from: self
		to: aTLNode
		visualization: self visualization)
		entity: anObject;
		yourself