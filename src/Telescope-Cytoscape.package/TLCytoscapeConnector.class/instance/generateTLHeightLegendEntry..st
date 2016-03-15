generation - legend
generateTLHeightLegendEntry: aTLHeightLegendEntry
	self
		addCommand:
			(TLVisualizationAddLegendEntryCommand visuId: self visuId html: aTLHeightLegendEntry cytoscapeHtmlRepresentation).
	^ aTLHeightLegendEntry