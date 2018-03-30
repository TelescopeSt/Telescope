accessing
elementFromTLDrawable: aNode ifNone: aBlock
	^ self shapeByDrawable at: aNode ifAbsent: [ aBlock value ]