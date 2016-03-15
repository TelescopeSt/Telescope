generation - legend
generateTLWidthLegendEntry: aTLWidthLegendEntry
	self
		addCommand:
			(TLVisualizationAddLegendEntryCommand visuId: self visuId html: aTLWidthLegendEntry cytoscapeHtmlRepresentation).
	^ aTLWidthLegendEntry