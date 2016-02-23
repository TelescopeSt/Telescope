*Telescope-Cytoscape
cytoscapeHtmlRepresentation
	^ '<td class="tlLegendIcon"><img src="' , (CYSFileLibrary urlOf: self iconName) asString
		, '"/></td><td class="tlLegendLabel">' , self label , '</td>'