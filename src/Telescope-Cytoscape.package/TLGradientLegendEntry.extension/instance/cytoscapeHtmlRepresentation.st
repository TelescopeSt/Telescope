*Telescope-Cytoscape
cytoscapeHtmlRepresentation
	| gradientCommand |
	gradientCommand := 'linear-gradient(to right,'
		,
			(self gradient levelForColors
				collect: [ :aLevelForColor | aLevelForColor value forCytoscape , ' ' , ((self gradient percentageForLevel: aLevelForColor key) * 100) asInteger asString , '%' ])
				asCommaString , ')'.
	^ '<td class="tlLegendIcon" style="background-image:' , gradientCommand , '"></td><td class="tlLegendLabel">'
		, self label , '</td>'