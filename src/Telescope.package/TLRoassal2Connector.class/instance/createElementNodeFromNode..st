generation - node
createElementNodeFromNode: aNode
	| element shape |
	shape := aNode shape generateWith: self.
	self customizeShape: shape withStyleSheet: aNode effectiveStyleSheet.
	element := shape elementOn: aNode entity.
	^ element