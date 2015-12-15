generation - legend
generateLegend: aTLLegend
	| legend |
	legend := self createLegendFrom: (aTLLegend items collect: [ :item | item generateWith: self  ]).
	self addElementLegendInView: legend.
	self registerShape: legend forDrawable: aTLLegend.
	^ legend