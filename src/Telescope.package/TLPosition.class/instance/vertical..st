accessing
vertical: verticalPosition
	self assert: (#(top center bottom) includes: verticalPosition) description: 'VerticalPosition position must be top, center or bottom'.
	vertical := verticalPosition