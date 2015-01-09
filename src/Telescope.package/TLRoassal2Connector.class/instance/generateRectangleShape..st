generation - shape
generateRectangleShape: aRectangleShape
	| shape |
	shape := RTBox new.
	shape
		color: aRectangleShape color;
		borderColor: aRectangleShape borderColor;
		borderWidth: aRectangleShape borderWidth;
		height: aRectangleShape height;
		width: aRectangleShape width.
	^ shape