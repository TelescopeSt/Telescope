Description
--------------------

I allow to export cytoscape visualizations as a PNG image.

Examples
--------------------

	html
	        render:
	            ((TLCytoscapeComponent visualization: visu id: visuId)
		                exportStrategy:
	                    (TLCytoscapePngExportStrategy new
 	                       fullExport: true;
	                        backgroundColor: MDLColor red;
	                        scale: 3;
	                        maxHeight: 200;
	                        maxWidth: 200;
	                        yourself);
	                yourself)
 
