generation - node
createElementNodeFromNode: aNode
	| element shape styleSheet |
	
	styleSheet := aNode effectiveStyleSheet.
	
	shape := self generateShapeCorrespondingTo: aNode shape.
	
	[shape := self makeCompositeShape: shape withLabel: (styleSheet nodeLabel rtValue: aNode entity)] on: KeyNotFound do: ["no need to create a composite shape"].		
	
	self customizeShape: shape withStyleSheet: styleSheet .
	element := shape elementOn: aNode entity.
	^ element