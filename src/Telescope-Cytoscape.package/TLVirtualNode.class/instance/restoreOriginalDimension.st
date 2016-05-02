dimension
restoreOriginalDimension
	| styleSheet |
	styleSheet := self realNode effectiveStyleSheet.
	self
		dimension:
			(styleSheet obtainValue: #width forEntity: self realNode entity)
				@ (styleSheet obtainValue: #height forEntity: self realNode entity)