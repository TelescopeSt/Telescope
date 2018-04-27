"
I am a command sent by the client when a node is moved by the user.
"
Class {
	#name : #TLNodeMovedCommand,
	#superclass : #TLVisualizationClientsCommand,
	#instVars : [
		'nodeId',
		'nodePosition'
	],
	#category : 'Telescope-Cytoscape-Commands'
}

{ #category : #'instance creation' }
TLNodeMovedCommand class >> newWithParameters: aParametersDictionary [
	^ self new
		visuId: (aParametersDictionary at: #id);
		nodeId: (aParametersDictionary at: #nodeId);
		nodePosition: ((aParametersDictionary at: #position) at: #x) @ ((aParametersDictionary at: #position) at: #y);
		yourself
]

{ #category : #execution }
TLNodeMovedCommand >> executeOnVisu: aVisualization [
	aVisualization generator executeMoveInteraction: self nodePosition onDrawableId: self nodeId
]

{ #category : #accessing }
TLNodeMovedCommand >> nodeId [
	^ nodeId
]

{ #category : #accessing }
TLNodeMovedCommand >> nodeId: anObject [
	nodeId := anObject
]

{ #category : #accessing }
TLNodeMovedCommand >> nodePosition [
	^ nodePosition
]

{ #category : #accessing }
TLNodeMovedCommand >> nodePosition: anObject [
	nodePosition := anObject
]
