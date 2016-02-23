generation - legend
generateLegend: aTLLegend
	| legend |
	legend := self createLegendFrom: (aTLLegend legendEntries collect: [ :entry | entry generateWith: self  ]).
	self addElementLegendInView: legend.
	self registerShape: legend forDrawable: aTLLegend.
	^ legend