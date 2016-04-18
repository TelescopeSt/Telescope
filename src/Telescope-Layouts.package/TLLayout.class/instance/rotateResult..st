placing
rotateResult: aResult
	^ aResult
		collect: [ :aPosition | 
			self angle = 0
				ifTrue: [ aPosition ]
				ifFalse: [ aPosition rotateBy: self angleInRadian about: 0 @ 0 ] ]