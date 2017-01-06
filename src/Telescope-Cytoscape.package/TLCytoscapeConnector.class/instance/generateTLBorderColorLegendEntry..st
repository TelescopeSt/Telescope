generation - legend
generateTLBorderColorLegendEntry: aTLBorderColorLegendEntry
	self
		addCommand:
			(TLVisualizationAddLegendEntryCommand visuId: self visuId html: aTLBorderColorLegendEntry cytoscapeHtmlRepresentation).
	^ aTLBorderColorLegendEntry