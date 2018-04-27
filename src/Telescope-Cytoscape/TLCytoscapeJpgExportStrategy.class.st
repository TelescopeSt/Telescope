"
Description
--------------------

I allow to export cytoscape visualizations as a JPG image.

/!\ The JPG format is lossy, whereas PNG is not. This means that I am useful for cases where filesize is more important than pixel-perfect images. JPEG compression will make your images (especially edge lines) blurry and distorted.


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
	quality:		<aNumber> 		Optional option to specify the quality of the image from 0 (low quality, low filesize) to 1 (high quality, high filesize). By default: the browser's default quality value is used.

"
Class {
	#name : #TLCytoscapeJpgExportStrategy,
	#superclass : #TLCytoscapeImageExportStrategy,
	#instVars : [
		'quality'
	],
	#category : 'Telescope-Cytoscape-Export'
}

{ #category : #export }
TLCytoscapeJpgExportStrategy >> exportJsFunctionName [
	^ 'jpg'
]

{ #category : #export }
TLCytoscapeJpgExportStrategy >> exportJsFunctionSpecificParametersOn: stream [
	super exportJsFunctionSpecificParametersOn: stream.
	self quality
		ifNotNil: [ :q | 
			stream
				nextPutAll: ', quality:';
				nextPutAll: q forCytoscape ]
]

{ #category : #accessing }
TLCytoscapeJpgExportStrategy >> extension [
	^ '.jpg'
]

{ #category : #accessing }
TLCytoscapeJpgExportStrategy >> iconName [
	^ 'downloadJpgPng'
]

{ #category : #accessing }
TLCytoscapeJpgExportStrategy >> quality [
	"Optional option to specify the quality of the image from 0 (low quality, low filesize) to 1 (high quality, high filesize). By default: the browser's default quality value is used."
	
	^ quality
]

{ #category : #options }
TLCytoscapeJpgExportStrategy >> quality: anInteger [
	"Optional option to specify the quality of the image from 0 (low quality, low filesize) to 1 (high quality, high filesize). By default: the browser's default quality value is used."
	
	quality := anInteger
]
