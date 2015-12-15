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
			self registerShape: shape forDrawable: aTLConnection.
			self generateInteractionsOf: aTLConnection targetingDrawable: aTLConnection.
			^ shape ]