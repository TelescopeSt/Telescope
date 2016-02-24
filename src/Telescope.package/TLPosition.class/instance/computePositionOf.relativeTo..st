positions
computePositionOf: anElementTrigger relativeTo: anElementNode
	| rectangle x y |
	rectangle := anElementNode encompassingRectangle.
	x := rectangle perform: self horizontal.
	y := rectangle perform: self vertical.	
		
		"If we have a point, for example if we get the center of the rectangle, we keep only the interesting part."
	x isPoint
		ifTrue: [ x := x x ].
	y isPoint
		ifTrue: [ y := y y ].
	^ x @ y