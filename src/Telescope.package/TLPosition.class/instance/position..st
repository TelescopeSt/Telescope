accessing
position: aPosition
	self
		assert: (self allowedPositions includes: aPosition)
		description: 'The position ' , aPosition asString , ' is not valid. Allowed positions are: ', self allowedPositions asString.
	position := aPosition