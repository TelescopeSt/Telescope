generation - shape
generateLabelShape: aLabelShape
	| shape |
	shape := RTLabel new.
	shape
		text: aLabelShape text;
		color: aLabelShape color.
	^ shape