Class {
	#name : #TLVisualizationGeneratedCommand,
	#superclass : #TLVisualizationServerCommand,
	#category : 'Telescope-Cytoscape-Commands'
}

{ #category : #command }
TLVisualizationGeneratedCommand class >> command [
	^ #generated
]

{ #category : #json }
TLVisualizationGeneratedCommand >> neoJsonOn: writer [
	writer
		writeMapStreamingDo: [ :jsonMapWriter | 
			jsonMapWriter writeKey: #command value: self class command.
			jsonMapWriter writeKey: #visuId value: self visuId.]
]
