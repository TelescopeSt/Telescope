removing - connection
removeConnection: aTLConnection
	| shape |
	shape := self elementFromTLDrawable: aTLConnection.
	self removeElementConnectionFromView: shape.
	self shapeByDrawable removeKey: aTLConnection.
	self removeInteractionsOf: aTLConnection