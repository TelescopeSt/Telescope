Class {
	#name : #TLMultiChoicesMenuInteractionCommand,
	#superclass : #TLInteractionCommand,
	#instVars : [
		'entry',
		'selection'
	],
	#category : 'Telescope-Cytoscape-Commands'
}

{ #category : #'as yet unclassified' }
TLMultiChoicesMenuInteractionCommand class >> newWithParameters: aParametersDictionary [
	^ (super newWithParameters: aParametersDictionary)
		entry: (aParametersDictionary at: #entry);
		selection: (aParametersDictionary at: #selection);
		yourself
]

{ #category : #accessing }
TLMultiChoicesMenuInteractionCommand >> entry [
	^ entry
]

{ #category : #accessing }
TLMultiChoicesMenuInteractionCommand >> entry: anObject [
	entry := anObject
]

{ #category : #execution }
TLMultiChoicesMenuInteractionCommand >> executeOnVisu: aTLVisualization [
	aTLVisualization generator executeMultiChoice: self selection menuInteraction: self entry onDrawableId: self drawableId
]

{ #category : #accessing }
TLMultiChoicesMenuInteractionCommand >> selection [
	^ selection
]

{ #category : #accessing }
TLMultiChoicesMenuInteractionCommand >> selection: anObject [
	selection := anObject
]
