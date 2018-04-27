Extension { #name : #TLGradientLegendEntry }

{ #category : #'*Telescope-Cytoscape' }
TLGradientLegendEntry >> cytoscapeHtmlRepresentation [
	| gradientCommand |
	gradientCommand := 'linear-gradient(to right,'
		,
			(self gradient levelForColors
				collect: [ :aLevelForColor | aLevelForColor value forCytoscape , ' ' , ((self gradient percentageForLevel: aLevelForColor key) * 100) asInteger asString , '%' ])
				asCommaString , ')'.
	^ '<td class="tlLegendIcon" style="background-image:' , gradientCommand , ';box-shadow: 0px 0px 5px -1px rgba(0,0,0,0.4);"></td><td class="tlLegendLabel">'
		, self label , '</td>'
]
