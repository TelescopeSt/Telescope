*Telescope-Cytoscape
cytoscapeHtmlRepresentation
	| css |
	css := 'color:', self styleSheet color forCytoscape,'; font-size:',self styleSheet fontSize .
	^ '<td class="tlLegendIcon" style="' , css , '">',self icon,'</td><td class="tlLegendLabel">'
		, self label , '</td>'