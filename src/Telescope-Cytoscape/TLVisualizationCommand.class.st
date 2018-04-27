"
I am the abstract superclass for all visualization commands
"
Class {
	#name : #TLVisualizationCommand,
	#superclass : #Object,
	#instVars : [
		'visuId'
	],
	#category : 'Telescope-Cytoscape-Commands'
}

{ #category : #command }
TLVisualizationCommand class >> command [
	self subclassResponsibility .
]

{ #category : #json }
TLVisualizationCommand >> neoJsonOn: writer [
	writer
		writeMapStreamingDo: [ :jsonMapWriter | 
			jsonMapWriter writeKey: #command value: self class command.
			self class allInstVarNames
				do: [ :anAttribute | jsonMapWriter writeKey: anAttribute value: (self perform: anAttribute) ] ]
]

{ #category : #accessing }
TLVisualizationCommand >> visuId [
	^ visuId
]

{ #category : #accessing }
TLVisualizationCommand >> visuId: anObject [
	visuId := anObject
]
