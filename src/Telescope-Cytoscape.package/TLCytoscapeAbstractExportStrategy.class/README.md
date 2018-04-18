Description
--------------------

I am an abstract class to define an export strategy for a cytoscape visualization.

Examples
--------------------

	html
	        render:
	            ((TLCytoscapeComponent visualization: visu id: visuId)
	                exportStrategy:
	                    (TLCytoscapeJpgExportStrategy new
	                        fullExport: true;
	                        backgroundColor: MDLColor red;
	                        scale: 3;
	                        maxHeight: 200;
	                        maxWidth: 200;
	                        quality: 1;
	                        yourself);
	                yourself)
 
