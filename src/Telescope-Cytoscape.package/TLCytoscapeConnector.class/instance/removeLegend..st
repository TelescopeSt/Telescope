removing - legend
removeLegend: aTLLegend
	self addCommand: (TLVisualizationRemoveLegendCommand new visuId: self visuId)