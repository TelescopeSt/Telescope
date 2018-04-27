"
I am the abstract superclass for all commands sent to the client by the server
"
Class {
	#name : #TLVisualizationServerCommand,
	#superclass : #TLVisualizationCommand,
	#category : 'Telescope-Cytoscape-Commands'
}

{ #category : #testing }
TLVisualizationServerCommand >> isAddingCommand [
	^ false
]

{ #category : #testing }
TLVisualizationServerCommand >> isMultiAdding [
	^ false
]
