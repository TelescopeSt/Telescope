generation - legend
generateLegendItem: aTLLegendItem
	| legendItem |
	legendItem := self createElementLegendItemFrom: aTLLegendItem.
	self addElementLegendItemInView: legendItem.
	self shapeByDrawable at: aTLLegendItem put: legendItem.
	self generateInteractionsOf: aTLLegendItem.
	^ legendItem