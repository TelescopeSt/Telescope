generation - connection
generateConnection: aTLConnection
	| shape |
	shape := self createElementConnectionFrom: aTLConnection fromNode to: aTLConnection toNode using: (aTLConnection edgeBuilder shapeFrom: aTLConnection fromNode to: aTLConnection toNode).
	self addElementConnectionInView: shape.
	self shapeByDrawable at: aTLConnection put: shape.
	self generateInteractionsOf: aTLConnection.
	^ shape