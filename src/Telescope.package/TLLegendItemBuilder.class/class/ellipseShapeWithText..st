as yet unclassified
ellipseShapeWithText: aString
	| itemBuilder |
	itemBuilder := self new shapeBuilder: (TLEllipseShapeBuilder new).
	itemBuilder labelBuilder text: aString.
	^ itemBuilder