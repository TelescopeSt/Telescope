Extension { #name : #TLStaticLegendEntry }

{ #category : #'*Telescope-Cytoscape' }
TLStaticLegendEntry >> cytoscapeHtmlRepresentation [
	^ '<td class="tlLegendIcon"><img src="' , (CYSFileLibrary urlOf: self iconName) asString
		, '"/></td><td class="tlLegendLabel">' , self label , '</td>'
]

{ #category : #'*Telescope-Cytoscape' }
TLStaticLegendEntry >> iconName [
	^ self subclassResponsibility 
]
