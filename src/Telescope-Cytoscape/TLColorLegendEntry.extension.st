Extension { #name : #TLColorLegendEntry }

{ #category : #'*Telescope-Cytoscape' }
TLColorLegendEntry >> cytoscapeHtmlRepresentation [
	^ '<td class="tlLegendIcon" style= "background-color: ' , self color forCytoscape , ';box-shadow: 0px 0px 5px -1px rgba(0,0,0,0.4);"></td><td class="tlLegendLabel">'
		, self label , '</td>'
]
