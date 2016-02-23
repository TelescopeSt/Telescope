generation - legend
createLegendFrom: legendEnties
	legendEnties do: [ :aLegendEntry | self addCommand: (TLVisualizationAddLegendEntryCommand for: aLegendEntry visuId: self visuId) ]