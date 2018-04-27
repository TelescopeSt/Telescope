"
I am a command that ask the client to add a legend entry
"
Class {
	#name : #TLVisualizationAddLegendEntryCommand,
	#superclass : #TLVisualizationServerCommand,
	#instVars : [
		'html',
		'entryId'
	],
	#category : 'Telescope-Cytoscape-Commands'
}

{ #category : #command }
TLVisualizationAddLegendEntryCommand class >> command [
	^ #addStaticLegendEntry
]

{ #category : #'instance creation' }
TLVisualizationAddLegendEntryCommand class >> for: aLegendEntry visuId: aVisuId [
	^ TLVisualizationAddLegendEntryCommand visuId: aVisuId html: aLegendEntry cytoscapeHtmlRepresentation
]

{ #category : #'instance-creation' }
TLVisualizationAddLegendEntryCommand class >> visuId: aVisuId html: aHtml [
	^ self new
		visuId: aVisuId;
		html: aHtml;
		yourself
]

{ #category : #accessing }
TLVisualizationAddLegendEntryCommand >> entryId [
	^ entryId
]

{ #category : #accessing }
TLVisualizationAddLegendEntryCommand >> entryId: anObject [
	entryId := anObject
]

{ #category : #accessing }
TLVisualizationAddLegendEntryCommand >> html [
	^ html
]

{ #category : #accessing }
TLVisualizationAddLegendEntryCommand >> html: anObject [
	html := anObject
]
