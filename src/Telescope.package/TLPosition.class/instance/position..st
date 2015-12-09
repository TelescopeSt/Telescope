accessing
position: aPosition
	self
		assert: (self class allowedPositions includes: aPosition)
		description: 'The position ' , aPosition asString , ' is not valid. Allowed positions are: ', self class allowedPositions asString.
	position := aPosition