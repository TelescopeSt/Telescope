placing
rotateResult: aResult
	^ aResult
		collect: [ :aPosition | 
			self angle = 0
				ifTrue: [ aPosition ]
				ifFalse: [ aPosition rotateBy: (self angleInRadians: self angle) about: 0 @ 0 ] ]