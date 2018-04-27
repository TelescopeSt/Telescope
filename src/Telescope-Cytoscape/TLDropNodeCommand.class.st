"
I am a command when a node is dropped on another one
"
Class {
	#name : #TLDropNodeCommand,
	#superclass : #TLVisualizationClientsCommand,
	#instVars : [
		'droppedNodeId',
		'targetNodeId'
	],
	#category : 'Telescope-Cytoscape-Commands'
}

{ #category : #'instance creation' }
TLDropNodeCommand class >> newWithParameters: aParametersDictionary [
	^ self new
		visuId: (aParametersDictionary at: #id);
		droppedNodeId: (aParametersDictionary at: #nodeId);
		targetNodeId: (aParametersDictionary at: #targetNode);
		yourself
]

{ #category : #accessing }
TLDropNodeCommand >> droppedNodeId [
	^ droppedNodeId
]

{ #category : #accessing }
TLDropNodeCommand >> droppedNodeId: anObject [
	droppedNodeId := anObject
]

{ #category : #execution }
TLDropNodeCommand >> executeOnVisu: aVisualization [
	aVisualization generator executeDropInteraction: self droppedNodeId onDrawableId: self targetNodeId
]

{ #category : #accessing }
TLDropNodeCommand >> targetNodeId [
	^ targetNodeId
]

{ #category : #accessing }
TLDropNodeCommand >> targetNodeId: anObject [
	targetNodeId := anObject
]
