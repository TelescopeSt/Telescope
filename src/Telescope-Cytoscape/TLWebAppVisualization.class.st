"
I'm a class that handles a TLVisualization. I'm used to redirect the visualization that has to be displayed.
I'm a singleton because I'm handled by a WebComponent for which I should not change.

The default visualization is a blank visualization.
"
Class {
	#name : #TLWebAppVisualization,
	#superclass : #Object,
	#instVars : [
		'visualization'
	],
	#category : 'Telescope-Cytoscape'
}

{ #category : #'as yet unclassified' }
TLWebAppVisualization class >> singleton [
self flag:'revoir comment on implem un singleton... Je n aime pas creer des variables de classe'.
	^self allInstances
		ifEmpty:[self new ]
		ifNotEmpty:[self allInstances first]
]

{ #category : #initialization }
TLWebAppVisualization >> defaultVisualization [
	^TLVisualization new.
]

{ #category : #initialization }
TLWebAppVisualization >> initialize [
	super initialize.
	visualization := self defaultVisualization
]

{ #category : #accessing }
TLWebAppVisualization >> visualization [
	^ visualization
]

{ #category : #accessing }
TLWebAppVisualization >> visualization: anObject [
	visualization := anObject
]
