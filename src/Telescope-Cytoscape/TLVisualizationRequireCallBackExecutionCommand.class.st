"
I am a command that ask the client to execute the provided callback by load a new page
"
Class {
	#name : #TLVisualizationRequireCallBackExecutionCommand,
	#superclass : #TLVisualizationServerCommand,
	#instVars : [
		'callbackUrl',
		'openInNewTab'
	],
	#category : 'Telescope-Cytoscape-Commands'
}

{ #category : #command }
TLVisualizationRequireCallBackExecutionCommand class >> command [
	^ #callbackUrl
]

{ #category : #accessing }
TLVisualizationRequireCallBackExecutionCommand >> callbackUrl [
	^ callbackUrl
]

{ #category : #accessing }
TLVisualizationRequireCallBackExecutionCommand >> callbackUrl: anObject [
	callbackUrl := anObject
]

{ #category : #accessing }
TLVisualizationRequireCallBackExecutionCommand >> openInNewTab [
	^ openInNewTab
]

{ #category : #accessing }
TLVisualizationRequireCallBackExecutionCommand >> openInNewTab: anObject [
	openInNewTab := anObject
]
