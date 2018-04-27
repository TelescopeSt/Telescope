"
I am the command for a new edge creation
"
Class {
	#name : #TLVisualizationAddEdgeCommand,
	#superclass : #TLVisualizationServerCommand,
	#instVars : [
		'edgeId',
		'fromNodeId',
		'toNodeId',
		'style',
		'mouseOverInteraction'
	],
	#category : 'Telescope-Cytoscape-Commands'
}

{ #category : #command }
TLVisualizationAddEdgeCommand class >> command [
	^ #add
]

{ #category : #accessing }
TLVisualizationAddEdgeCommand >> edgeId [
	^ edgeId
]

{ #category : #accessing }
TLVisualizationAddEdgeCommand >> edgeId: anObject [
	edgeId := anObject
]

{ #category : #accessing }
TLVisualizationAddEdgeCommand >> fromNodeId [
	^ fromNodeId
]

{ #category : #accessing }
TLVisualizationAddEdgeCommand >> fromNodeId: anObject [
	fromNodeId := anObject
]

{ #category : #testing }
TLVisualizationAddEdgeCommand >> isAddingCommand [
	^ true
]

{ #category : #accessing }
TLVisualizationAddEdgeCommand >> mouseOverInteraction [
	^ mouseOverInteraction
]

{ #category : #accessing }
TLVisualizationAddEdgeCommand >> mouseOverInteraction: anObject [
	mouseOverInteraction := anObject
]

{ #category : #json }
TLVisualizationAddEdgeCommand >> neoJsonOn: writer [
	writer
		writeMapStreamingDo: [ :jsonMapWriter | 
			jsonMapWriter writeKey: #group value: #edges.
			jsonMapWriter
				writeKey: #data
				value:
					{(#id -> self edgeId).
					(#source -> self fromNodeId).
					(#target -> self toNodeId)} asDictionary.
			jsonMapWriter writeKey: #mouseOverInteraction value: self mouseOverInteraction.
			jsonMapWriter writeKey: #style value: self style ]
]

{ #category : #accessing }
TLVisualizationAddEdgeCommand >> style [
	^ style
]

{ #category : #accessing }
TLVisualizationAddEdgeCommand >> style: anObject [
	style := anObject
]

{ #category : #accessing }
TLVisualizationAddEdgeCommand >> toNodeId [
	^ toNodeId
]

{ #category : #accessing }
TLVisualizationAddEdgeCommand >> toNodeId: anObject [
	toNodeId := anObject
]
