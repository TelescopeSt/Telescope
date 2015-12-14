generation - connection
generateConnection: aTLConnection
	| shape |
	aTLConnection isVisible
		ifTrue: [ 
			shape := self
				createElementConnection: aTLConnection
				From: aTLConnection fromNode
				to: aTLConnection toNode.
			self addElementConnectionInView: shape.
			self shapeByDrawable at: aTLConnection put: shape.
			self generateInteractionsOf: aTLConnection targetingDrawable: aTLConnection.
			^ shape ]