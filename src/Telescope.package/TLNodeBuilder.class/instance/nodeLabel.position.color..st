as yet unclassified
nodeLabel: aTextBlockOrSymbol position: aPositionSymbol color: aColor
	self shapeBuilder: (self shapeBuilder transformToCompositeWithLabel: aTextBlockOrSymbol).
	self shapeBuilder labelPosition: aPositionSymbol; labelColor: aColor