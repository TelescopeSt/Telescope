"
I am the command sent by the client after an interaction occurs (click, mouseOver...)
"
Class {
	#name : #TLInteractionCommand,
	#superclass : #TLVisualizationClientsCommand,
	#instVars : [
		'drawableId',
		'kind'
	],
	#category : 'Telescope-Cytoscape-Commands'
}

{ #category : #'instance creation' }
TLInteractionCommand class >> newWithParameters: aParametersDictionary [
	^ self new
		visuId: (aParametersDictionary at: #id);
		drawableId: (aParametersDictionary at: #drawableId);
		kind: (aParametersDictionary at: #kind);
		yourself
]

{ #category : #accessing }
TLInteractionCommand >> drawableId [
	^ drawableId
]

{ #category : #accessing }
TLInteractionCommand >> drawableId: anObject [
	drawableId := anObject
]

{ #category : #execution }
TLInteractionCommand >> executeOnVisu: aTLVisualization [
	aTLVisualization generator executeInteraction: self kind onDrawableId: self drawableId
]

{ #category : #accessing }
TLInteractionCommand >> kind [
	^ kind
]

{ #category : #accessing }
TLInteractionCommand >> kind: anObject [
	kind := anObject
]
