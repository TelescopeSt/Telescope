generation - legend
generateTLGradientLegendEntry: aTLGradientLegendEntry
	self
		addCommand:
			(TLVisualizationAddLegendEntryCommand visuId: self visuId html: aTLGradientLegendEntry cytoscapeHtmlRepresentation).
	^ aTLGradientLegendEntry