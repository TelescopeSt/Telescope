"
I am a command that ask the client to add a trigger on the referenced node
"
Class {
	#name : #TLVisualizationAddTriggerCommand,
	#superclass : #TLVisualizationServerCommand,
	#instVars : [
		'mouseOverInteraction',
		'style',
		'virtualNodeReference',
		'virtualTrigger'
	],
	#category : 'Telescope-Cytoscape-Commands'
}

{ #category : #command }
TLVisualizationAddTriggerCommand class >> command [
	^ #addTrigger
]

{ #category : #testing }
TLVisualizationAddTriggerCommand >> isAddingCommand [
	^ true
]

{ #category : #accessing }
TLVisualizationAddTriggerCommand >> mouseOverInteraction [
	^ mouseOverInteraction
]

{ #category : #accessing }
TLVisualizationAddTriggerCommand >> mouseOverInteraction: anObject [
	mouseOverInteraction := anObject
]

{ #category : #json }
TLVisualizationAddTriggerCommand >> neoJsonOn: writer [
	| data |
	data := {(#id -> self triggerId)} asDictionary.
	writer
		writeMapStreamingDo: [ :jsonMapWriter | 
			| position |
			position := self virtualTrigger cytoscapePosition value.
			jsonMapWriter writeKey: #group value: #nodes.
			jsonMapWriter writeKey: #data value: data.
			jsonMapWriter
				writeKey: #position
				value:
					{(#x -> position x).
					(#y -> position y)} asDictionary.
			jsonMapWriter writeKey: #mouseOverInteraction value: self mouseOverInteraction.
			jsonMapWriter writeKey: #style value: self style ]
]

{ #category : #accessing }
TLVisualizationAddTriggerCommand >> style [
	^ style
]

{ #category : #accessing }
TLVisualizationAddTriggerCommand >> style: anObject [
	style := anObject
]

{ #category : #accessing }
TLVisualizationAddTriggerCommand >> triggerId [
	^ self virtualTrigger nodeId
]

{ #category : #accessing }
TLVisualizationAddTriggerCommand >> virtualNodeReference [
	^ virtualNodeReference
]

{ #category : #accessing }
TLVisualizationAddTriggerCommand >> virtualNodeReference: anObject [
	virtualNodeReference := anObject
]

{ #category : #accessing }
TLVisualizationAddTriggerCommand >> virtualTrigger [
	^ virtualTrigger
]

{ #category : #accessing }
TLVisualizationAddTriggerCommand >> virtualTrigger: anObject [
	virtualTrigger := anObject
]
