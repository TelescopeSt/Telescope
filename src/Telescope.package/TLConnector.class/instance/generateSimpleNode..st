generation - node
generateSimpleNode: aSimpleNode
	| element |
	element := self createElementNodeFromNode: aSimpleNode.
	self addElementNodeInView: element.
	self shapeByDrawable at: aSimpleNode put: element.
	self generateInteractionsOf: aSimpleNode.
	self generateIfNecessaryConnectionsOf: aSimpleNode.
	element update.
	^ element