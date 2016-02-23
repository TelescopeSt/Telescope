*Telescope-Cytoscape
cytoscapeHtmlRepresentation
	^ '<tr><td class="tlLegendIcon"><img href="' , (CYSFileLibrary urlOf: self iconName) asString
		, '"/></td><td class="tlLegendLabel">' , self label , '</td></tr>'