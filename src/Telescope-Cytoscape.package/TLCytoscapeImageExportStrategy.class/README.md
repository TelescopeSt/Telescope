Description
--------------------

I am an abstract class managing the common options of an image export.

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
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	backgroundColor:		<aColor>		Optional option to define the background color of the export. By default: transparent.
	fullExport:				<aBoolean>		Optional option to define if the export should export the full visualization or only the current viewport. By default: true. 
	maxHeight:				<anInteger>		Optional option to define the maximum height of the export in pixels. By default: none.
	maxWidth:				<anInteger>		Optional option to define the maximum width of the export in pixels. By default: none.
	scale:					<aNumber>		Optional option to define the scale of the export. Should be a positive number. By default: 1.
