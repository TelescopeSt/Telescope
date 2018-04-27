"
I am the command for a connection style customization
"
Class {
	#name : #TLVisualizationCustomizeConnectionCommand,
	#superclass : #TLVisualizationDrawableCommand,
	#instVars : [
		'connectionId'
	],
	#category : 'Telescope-Cytoscape-Commands'
}

{ #category : #command }
TLVisualizationCustomizeConnectionCommand class >> command [
	^ #customize
]

{ #category : #accessing }
TLVisualizationCustomizeConnectionCommand >> connectionId [
	^ connectionId
]

{ #category : #accessing }
TLVisualizationCustomizeConnectionCommand >> connectionId: aString [
	connectionId := aString
]

{ #category : #json }
TLVisualizationCustomizeConnectionCommand >> neoJsonOn: writer [
	writer
		writeMapStreamingDo: [ :jsonMapWriter | 
			jsonMapWriter writeKey: #command value: self class command.
			jsonMapWriter writeKey: #visuId value: self visuId.
			jsonMapWriter writeKey: #elementId value: self connectionId.
			jsonMapWriter writeKey: #mouseOverInteraction value: self mouseOverInteraction.
			jsonMapWriter writeKey: #dropInteraction value: self dropInteraction.
			jsonMapWriter writeKey: #style value: self style ]
]
