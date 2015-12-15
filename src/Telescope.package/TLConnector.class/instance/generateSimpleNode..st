generation - node
generateSimpleNode: aSimpleNode
	| element |
	element := self createElementNodeFromNode: aSimpleNode.
	self addElementNodeInView: element.
	self registerShape: element forDrawable: aSimpleNode.
	self generateInteractionsOf: aSimpleNode targetingDrawable: aSimpleNode.
	self generateIfNecessaryConnectionsOf: aSimpleNode.
	^ element