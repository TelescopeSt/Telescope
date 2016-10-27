generation - legend
generateTLStyleSheetLegendEntry: aTLStyleSheetLegendEntry
	self
		addCommand:
			(TLVisualizationAddLegendEntryCommand visuId: self visuId html: aTLStyleSheetLegendEntry cytoscapeHtmlRepresentation).
	^ aTLStyleSheetLegendEntry