"
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

"
Class {
	#name : #TLCytoscapeImageExportStrategy,
	#superclass : #TLCytoscapeAbstractExportStrategy,
	#instVars : [
		'fullExport',
		'backgroundColor',
		'scale',
		'maxWidth',
		'maxHeight'
	],
	#category : 'Telescope-Cytoscape-Export'
}

{ #category : #testing }
TLCytoscapeImageExportStrategy class >> isAbstract [
	^ self = TLCytoscapeImageExportStrategy
]

{ #category : #accessing }
TLCytoscapeImageExportStrategy >> backgroundColor [	
	"Optional option to define the background color of the export. By default: transparent."
	
	^ backgroundColor
]

{ #category : #options }
TLCytoscapeImageExportStrategy >> backgroundColor: aColor [
	"Optional option to define the background color of the export. By default: transparent."
	
	backgroundColor := aColor
]

{ #category : #export }
TLCytoscapeImageExportStrategy >> exportJsFunctionName [
	^ self subclassResponsibility
]

{ #category : #export }
TLCytoscapeImageExportStrategy >> exportJsFunctionNameOn: aStream [
	aStream nextPutAll: self exportJsFunctionName
]

{ #category : #export }
TLCytoscapeImageExportStrategy >> exportJsFunctionOn: aStream [
	self
		exportJsFunctionNameOn: aStream;
		exportJsFunctionParametersOn: aStream
]

{ #category : #export }
TLCytoscapeImageExportStrategy >> exportJsFunctionParameters [
	^ String
		streamContents: [ :stream | 
			stream nextPutAll: '({'.
			self exportJsFunctionSpecificParametersOn: stream.
			stream nextPutAll: '})' ]
]

{ #category : #export }
TLCytoscapeImageExportStrategy >> exportJsFunctionParametersOn: aStream [
	aStream nextPutAll: '({'.
	self exportJsFunctionSpecificParametersOn: aStream.
	aStream nextPutAll: '})'
]

{ #category : #export }
TLCytoscapeImageExportStrategy >> exportJsFunctionSpecificParametersOn: stream [
	stream
		nextPutAll: 'full:';
		nextPutAll: self fullExport asString.
	self backgroundColor
		ifNotNil: [ :bg | 
			stream
				nextPutAll: ', bg:"';
				nextPutAll: bg forCytoscape;
				nextPut: $" ].
	self scale
		ifNotNil: [ :s | 
			stream
				nextPutAll: ', scale:';
				nextPutAll: scale forCytoscape ].
	self maxHeight
		ifNotNil: [ :mh | 
			stream
				nextPutAll: ', maxHeight:';
				nextPutAll: mh forCytoscape ].
	self maxWidth
		ifNotNil: [ :mw | 
			stream
				nextPutAll: ', maxWidth:';
				nextPutAll: mw forCytoscape ]
]

{ #category : #accessing }
TLCytoscapeImageExportStrategy >> fullExport [
	"Optional option to define if the export should export the full visualization or only the current viewport. By default: true."
	
	^ fullExport ifNil: [ fullExport := true ]
]

{ #category : #options }
TLCytoscapeImageExportStrategy >> fullExport: aBoolean [
	"Optional option to define if the export should export the full visualization or only the current viewport. By default: true."
	
	fullExport := aBoolean
]

{ #category : #accessing }
TLCytoscapeImageExportStrategy >> maxHeight [
	"Optional option to define the maximum height of the export in pixels. By default: none."
	
	^ maxHeight
]

{ #category : #options }
TLCytoscapeImageExportStrategy >> maxHeight: anInteger [
	"Optional option to define the maximum height of the export in pixels. By default: none."
	
	maxHeight := anInteger
]

{ #category : #accessing }
TLCytoscapeImageExportStrategy >> maxWidth [
	"Optional option to define the maximum width of the export in pixels. By default: none."
	
	^ maxWidth
]

{ #category : #options }
TLCytoscapeImageExportStrategy >> maxWidth: anInteger [
	"Optional option to define the maximum width of the export in pixels. By default: none."
	
	maxWidth := anInteger
]

{ #category : #accessing }
TLCytoscapeImageExportStrategy >> scale [
	"Optional option to define the scale of the export. Should be a positive number. By default: 1."
	
	^ scale ifNil: [ scale := 1 ]
]

{ #category : #options }
TLCytoscapeImageExportStrategy >> scale: anInteger [
	"Optional option to define the scale of the export. Should be a positive number. By default: 1."
	
	scale := anInteger
]

{ #category : #export }
TLCytoscapeImageExportStrategy >> telescopeExportFunction [
	^ 'downloadImage'
]
