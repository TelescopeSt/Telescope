"
Description
--------------------

I allow to export the visualization as a JSON file.

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
"
Class {
	#name : #TLCytoscapeJSONExportStrategy,
	#superclass : #TLCytoscapeAbstractExportStrategy,
	#category : 'Telescope-Cytoscape-Export'
}

{ #category : #export }
TLCytoscapeJSONExportStrategy >> exportJsFunctionOn: aStream [
	aStream nextPutAll: 'json()'
]

{ #category : #accessing }
TLCytoscapeJSONExportStrategy >> extension [
	^ '.json'
]

{ #category : #accessing }
TLCytoscapeJSONExportStrategy >> iconName [
	^ 'downloadJsonPng'
]

{ #category : #export }
TLCytoscapeJSONExportStrategy >> telescopeExportFunction [
	^ 'downloadJSON'
]
