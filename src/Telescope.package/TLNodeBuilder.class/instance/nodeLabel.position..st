as yet unclassified
nodeLabel: aTextBlockOrSymbol position: aPositionSymbol
	self shapeBuilder: (self shapeBuilder transformToCompositeWithLabel: aTextBlockOrSymbol).
	self shapeBuilder labelPosition: aPositionSymbol