generation - legend
generateLegendItem: aTLLegendItem
	| legendItem |
	legendItem := self createElementLegendItemFrom: aTLLegendItem.
	self addElementLegendItemInView: legendItem.
	self registerShape: legendItem forDrawable: aTLLegendItem.
	self generateInteractionsOf: aTLLegendItem targetingDrawable: aTLLegendItem.
	^ legendItem