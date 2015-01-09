generation - shape
generateEllipseShape: anEllipseShape
	| shape |
	shape := RTEllipse new.
	shape
		color: anEllipseShape color;
		borderColor: anEllipseShape borderColor;
		borderWidth: anEllipseShape borderWidth;
		height: anEllipseShape height;
		width: anEllipseShape width.
	^ shape