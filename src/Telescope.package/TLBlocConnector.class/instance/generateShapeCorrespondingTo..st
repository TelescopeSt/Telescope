generation - shape
generateShapeCorrespondingTo: aTLSimpleShape
	^ ({TLEllipse -> BlEllipseView . TLRectangle -> BlRectangleView  } asDictionary at: aTLSimpleShape) new