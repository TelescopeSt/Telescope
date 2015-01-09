as yet unclassified
nodeLabel: aTextBlockOrSymbol position: aPositionSymbol color: aColor fontSize: aNumber
	self shapeBuilder: (self shapeBuilder transformToCompositeWithLabel: aTextBlockOrSymbol).
	self shapeBuilder labelPosition: aPositionSymbol; labelColor: aColor; labelFontSize: aNumber