"
Description
--------------------

Defines the default behaviour when there is no export function selected for a visualization.
"
Class {
	#name : #TLCytoscapeNullExportStrategy,
	#superclass : #Object,
	#category : 'Telescope-Cytoscape-Export'
}

{ #category : #rendering }
TLCytoscapeNullExportStrategy >> renderDownloadButtonForVisu: aVisuId on: html [
	"Nothing to do in the null strategy"
]
