"
I am the command for a node style customization
"
Class {
	#name : #TLVisualizationCustomizeElementCommand,
	#superclass : #TLVisualizationDrawableCommand,
	#instVars : [
		'virtualNode'
	],
	#category : 'Telescope-Cytoscape-Commands'
}

{ #category : #command }
TLVisualizationCustomizeElementCommand class >> command [
	^ #customize
]

{ #category : #'as yet unclassified' }
TLVisualizationCustomizeElementCommand >> neoJsonOn: writer [
	writer
		writeMapStreamingDo: [ :jsonMapWriter | 
			jsonMapWriter writeKey: #command value: self class command.
			jsonMapWriter writeKey: #visuId value: self visuId.
			jsonMapWriter writeKey: #elementId value: self nodeId.
			jsonMapWriter writeKey: #mouseOverInteraction value: self mouseOverInteraction.
			jsonMapWriter writeKey: #dropInteraction value: self dropInteraction.
			jsonMapWriter writeKey: #style value: self style ]
]

{ #category : #accessing }
TLVisualizationCustomizeElementCommand >> nodeId [
	^ self virtualNode nodeId
]

{ #category : #accessing }
TLVisualizationCustomizeElementCommand >> virtualNode [
	^ virtualNode
]

{ #category : #accessing }
TLVisualizationCustomizeElementCommand >> virtualNode: anObject [
	virtualNode := anObject
]
