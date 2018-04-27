"
I am the command to remove a node on the client
"
Class {
	#name : #TLVisualizationRemoveElementCommand,
	#superclass : #TLVisualizationServerCommand,
	#instVars : [
		'nodeId'
	],
	#category : 'Telescope-Cytoscape-Commands'
}

{ #category : #command }
TLVisualizationRemoveElementCommand class >> command [
	^ #remove
]

{ #category : #json }
TLVisualizationRemoveElementCommand >> neoJsonOn: writer [
	writer
		writeMapStreamingDo: [ :jsonMapWriter | 
			jsonMapWriter writeKey: #command value: self class command.
			jsonMapWriter writeKey: #visuId value: self visuId.
			jsonMapWriter writeKey: #nodeId value: self nodeId.
			 ]
]

{ #category : #accessing }
TLVisualizationRemoveElementCommand >> nodeId [
	^ nodeId
]

{ #category : #accessing }
TLVisualizationRemoveElementCommand >> nodeId: anObject [
	nodeId := anObject
]
