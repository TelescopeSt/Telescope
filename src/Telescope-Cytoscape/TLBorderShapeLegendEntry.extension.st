Extension { #name : #TLBorderShapeLegendEntry }

{ #category : #'*Telescope-Cytoscape' }
TLBorderShapeLegendEntry >> cytoscapeHtmlRepresentation [
	^ '<td class="tlLegendIcon" style= "border: black 2px ' , self shape forCytoscape
		, ';"></td><td class="tlLegendLabel">' , self label , '</td>'
]
