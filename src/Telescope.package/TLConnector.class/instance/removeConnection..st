removing - connection
removeConnection: aTLConnection
	| shape |
	
	shape := self elementFromTLDrawable: aTLConnection.
	self removeElementConnectionFromView: shape.
	self unregisterShapeForDrawable: aTLConnection.
	self removeInteractionsOf: aTLConnection