*Telescope-Cytoscape
cytoscapeHtmlRepresentation
	^ String
		streamContents: [ :s | 
			s
				nextPutAll: '<td class="tlLegendIcon" style="color:';
				nextPutAll: self styleSheet color forCytoscape;
				nextPutAll: '; font-size:';
				nextPutAll: self styleSheet fontSize;
				nextPutAll: '">';
				nextPutAll: self icon;
				nextPutAll: '</td><td class="tlLegendLabel">';
				nextPutAll: self label;
				nextPutAll: '</td>' ]