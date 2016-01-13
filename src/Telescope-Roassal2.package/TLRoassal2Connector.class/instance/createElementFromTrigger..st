generation - interaction
createElementFromTrigger: aTLShapeTrigger
	| shape styleSheet |
	styleSheet := aTLShapeTrigger effectiveStyleSheet.
	shape := self generateShapeCorrespondingTo: aTLShapeTrigger shape.
	[ shape := self makeCompositeShape: shape withLabel: styleSheet nodeLabel ]
		on: KeyNotFound
		do: [ 
			"no need to create a composite shape"
			 ].
	self customizeShape: shape withStyleSheet: styleSheet.
	^ shape elementOn: nil