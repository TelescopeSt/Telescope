instance creation
for: aLegendEntry visuId: aVisuId
	^ aLegendEntry isStatic
		ifTrue: [ TLVisualizationAddStaticLegendEntryCommand visuId: aVisuId html: aLegendEntry cytoscapeHtmlRepresentation ]
		ifFalse: [ Halt now ]