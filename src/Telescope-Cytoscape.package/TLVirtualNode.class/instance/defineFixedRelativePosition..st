position
defineFixedRelativePosition: aPosition
	self userFixedPosition: false.
	aPosition
		ifNotNil: [ 
			self position: aPosition.
			self userFixedPosition: true ]