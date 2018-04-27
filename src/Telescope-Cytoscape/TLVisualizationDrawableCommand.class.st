"
I am a superclass for all commands that concerns drawable to factorize style customization and interactions
"
Class {
	#name : #TLVisualizationDrawableCommand,
	#superclass : #TLVisualizationServerCommand,
	#instVars : [
		'mouseOverInteraction',
		'dropInteraction',
		'popUp',
		'menu',
		'style'
	],
	#category : 'Telescope-Cytoscape-Commands'
}

{ #category : #accessing }
TLVisualizationDrawableCommand >> dropInteraction [
	^ dropInteraction
]

{ #category : #accessing }
TLVisualizationDrawableCommand >> dropInteraction: anObject [
	dropInteraction := anObject
]

{ #category : #accessing }
TLVisualizationDrawableCommand >> menu [
	^ menu
]

{ #category : #accessing }
TLVisualizationDrawableCommand >> menu: anObject [
	menu := anObject
]

{ #category : #accessing }
TLVisualizationDrawableCommand >> mouseOverInteraction [
	^ mouseOverInteraction
]

{ #category : #accessing }
TLVisualizationDrawableCommand >> mouseOverInteraction: anObject [
	mouseOverInteraction := anObject
]

{ #category : #accessing }
TLVisualizationDrawableCommand >> popUp [
	^ popUp
]

{ #category : #accessing }
TLVisualizationDrawableCommand >> popUp: anObject [
	popUp := anObject
]

{ #category : #accessing }
TLVisualizationDrawableCommand >> style [
	^ style
]

{ #category : #accessing }
TLVisualizationDrawableCommand >> style: anObject [
	style := anObject
]
