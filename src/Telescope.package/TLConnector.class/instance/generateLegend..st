generation - legend
generateLegend: aTLLegend
	| legend |
	legend := self createLegendFrom: (aTLLegend items collect: [ :item | item parent: aTLLegend. item generateWith: self  ]).
	self addElementLegendInView: legend.
	self  shapeByDrawable at: aTLLegend put: legend.
	^ legend