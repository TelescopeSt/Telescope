as yet unclassified
defineFixedPositionFromAbsolute: aPosition
	self userFixedPosition: false.
	self
		position:
			aPosition
				-
					(self hasParent
						ifTrue: [ parent upperLeftAbsolutePosition ]
						ifFalse: [ 0 @ 0 ]).
	self userFixedPosition: true