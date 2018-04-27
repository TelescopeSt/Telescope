"
I am a specialized interaction for menu
"
Class {
	#name : #TLMenuInteractionCommand,
	#superclass : #TLInteractionCommand,
	#instVars : [
		'entry'
	],
	#category : 'Telescope-Cytoscape-Commands'
}

{ #category : #'instance creation' }
TLMenuInteractionCommand class >> newWithParameters: aParametersDictionary [
	^ (super newWithParameters: aParametersDictionary)
		entry: (aParametersDictionary at: #entry);
		yourself
]

{ #category : #accessing }
TLMenuInteractionCommand >> entry [
	^ entry
]

{ #category : #accessing }
TLMenuInteractionCommand >> entry: anObject [
	entry := anObject
]

{ #category : #'as yet unclassified' }
TLMenuInteractionCommand >> executeOnVisu: aTLVisualization [
	aTLVisualization generator executeMenuInteraction: self entry onDrawableId: self drawableId
]
