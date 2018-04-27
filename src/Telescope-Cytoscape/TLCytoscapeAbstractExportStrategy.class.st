"
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
 

"
Class {
	#name : #TLCytoscapeAbstractExportStrategy,
	#superclass : #Object,
	#category : 'Telescope-Cytoscape-Export'
}

{ #category : #testing }
TLCytoscapeAbstractExportStrategy class >> isAbstract [
	^ self = TLCytoscapeAbstractExportStrategy
]

{ #category : #export }
TLCytoscapeAbstractExportStrategy >> exportJsFunctionOn: aStream [
	^ self subclassResponsibility
]

{ #category : #accessing }
TLCytoscapeAbstractExportStrategy >> extension [
	"Return a string corresponding to the extension of the file to export."
	
	^ self subclassResponsibility
]

{ #category : #accessing }
TLCytoscapeAbstractExportStrategy >> fileName [
	"Name of the file to export"
	
	^ DateAndTime now printString , self extension
]

{ #category : #accessing }
TLCytoscapeAbstractExportStrategy >> iconName [
	"Name of the image to display next to the Telescope visualization as a button form the CYSFileLibrary"
	
	^ self subclassResponsibility
]

{ #category : #javascript }
TLCytoscapeAbstractExportStrategy >> jsExportForVisu: aVisuId [
	^ String
		streamContents: [ :stream | 
			stream
				nextPutAll: 'Telescope.';
				nextPutAll: self telescopeExportFunction;
				nextPutAll: '("';
				nextPutAll: self fileName;
				nextPutAll: '", telescope.visuWithId(';
				nextPutAll: aVisuId asString;
				nextPutAll: ').'.
			self exportJsFunctionOn: stream.
			stream nextPutAll: ');' ]
]

{ #category : #rendering }
TLCytoscapeAbstractExportStrategy >> renderDownloadButtonForVisu: aVisuId on: html [
	html image
		url: (CYSFileLibrary urlOf: self iconName);
		onClick: (self jsExportForVisu: aVisuId) js
]

{ #category : #export }
TLCytoscapeAbstractExportStrategy >> telescopeExportFunction [
	^ self subclassResponsibility
]
