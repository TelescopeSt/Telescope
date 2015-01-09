as yet unclassified
rectangleShapeWithText: aString
	| itemBuilder |
	itemBuilder := self new shapeBuilder: (TLBoxShapeBuilder new).
	itemBuilder labelBuilder text: aString.
	^ itemBuilder