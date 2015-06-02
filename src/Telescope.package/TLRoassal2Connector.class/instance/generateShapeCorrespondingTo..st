generation - shape
generateShapeCorrespondingTo: aTLSimpleShape
	^ ({TLEllipse -> RTEllipse . TLRectangle -> RTBox . TLNoShape -> RTLabel } asDictionary at: aTLSimpleShape) new