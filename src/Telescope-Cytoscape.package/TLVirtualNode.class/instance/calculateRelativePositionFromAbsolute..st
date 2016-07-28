position
calculateRelativePositionFromAbsolute: aPosition
	^ aPosition
		-
			(self hasParent
				ifTrue: [ parent upperLeftAbsolutePosition ]
				ifFalse: [ 0 @ 0 ])