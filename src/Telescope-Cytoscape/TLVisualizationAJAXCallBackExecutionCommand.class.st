"
I am a command that ask the client to execute the provided callback with a ajax call to the serveur.
"
Class {
	#name : #TLVisualizationAJAXCallBackExecutionCommand,
	#superclass : #TLVisualizationServerCommand,
	#instVars : [
		'callbackUrl',
		'cssQuery'
	],
	#category : 'Telescope-Cytoscape-Commands'
}

{ #category : #command }
TLVisualizationAJAXCallBackExecutionCommand class >> command [
	^ #ajax
]

{ #category : #accessing }
TLVisualizationAJAXCallBackExecutionCommand >> callbackUrl [
	^ callbackUrl
]

{ #category : #accessing }
TLVisualizationAJAXCallBackExecutionCommand >> callbackUrl: anObject [
	callbackUrl := anObject
]

{ #category : #accessing }
TLVisualizationAJAXCallBackExecutionCommand >> cssQuery [
	^ cssQuery
]

{ #category : #accessing }
TLVisualizationAJAXCallBackExecutionCommand >> cssQuery: anObject [
	cssQuery := anObject
]
