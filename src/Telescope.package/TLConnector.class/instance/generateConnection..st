generation - connection
generateConnection: aTLConnection
	| shape |
	aTLConnection isVisible
		ifTrue: [ 
			shape := self
				createElementConnectionFrom: aTLConnection fromNode
				to: aTLConnection toNode
				using: (aTLConnection effectiveStyleSheet).
			self addElementConnectionInView: shape.
			self shapeByDrawable at: aTLConnection put: shape.
			self generateInteractionsOf: aTLConnection targetingDrawable: aTLConnection.
			^ shape ]