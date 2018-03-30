accessing
elementFromTLDrawable: aNode ifPresent: aBlock ifNone: anotherBlock
	^ self shapeByDrawable at: aNode ifPresent: [ :shape | aBlock value: shape ] ifAbsent: [ anotherBlock value ]