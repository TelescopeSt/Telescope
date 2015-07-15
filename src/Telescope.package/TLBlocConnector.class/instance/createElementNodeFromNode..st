generation - node
createElementNodeFromNode: aNode 
	
	| styleSheet blocView |
	styleSheet := aNode effectiveStyleSheet.
	
	blocView := self generateShapeCorrespondingTo: styleSheet shape.
	
	self customizeShape: blocView withStyleSheet: styleSheet .
	
	^ blocView