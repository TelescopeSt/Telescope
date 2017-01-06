generation - legend
generateTLBorderShapeLegendEntry: aTLBorderShapeLegendEntry
	self
		addCommand:
			(TLVisualizationAddLegendEntryCommand visuId: self visuId html: aTLBorderShapeLegendEntry cytoscapeHtmlRepresentation).
	^ aTLBorderShapeLegendEntry