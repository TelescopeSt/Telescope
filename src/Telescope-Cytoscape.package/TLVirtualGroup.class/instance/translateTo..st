actions
translateTo: aPosition
	| center |
	center := self encompassingRectangle origin.
	self translateBy: (aPosition - center)