legend
generateTLColorLegendEntry: aTLColorLegendEntry 
	self
		addCommand:
			(TLVisualizationAddLegendEntryCommand visuId: self visuId html: aTLColorLegendEntry cytoscapeHtmlRepresentation).
	^ aTLColorLegendEntry