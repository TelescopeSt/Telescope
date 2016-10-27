*Telescope-Cytoscape
cytoscapeHtmlRepresentation
	| css |
	css := 'color:', self styleSheet color asHTMLColor,'; font-size:',self styleSheet fontSize .
	^ '<td class="tlLegendIcon" style="' , css , '">',self icon,'</td><td class="tlLegendLabel">'
		, self label , '</td>'