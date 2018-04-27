"
I am the abstract superclass for all commands sent by the client
"
Class {
	#name : #TLVisualizationClientsCommand,
	#superclass : #TLVisualizationCommand,
	#category : 'Telescope-Cytoscape-Commands'
}

{ #category : #'instance-creation' }
TLVisualizationClientsCommand class >> createFrom: aJsonDictionary [
	^ ({('generate' -> TLVisualizationGenerationCommand).
	('interaction' -> TLInteractionCommand).
	('menuInteraction' -> TLMenuInteractionCommand).
	('multiMenuInteraction' -> TLMultiChoicesMenuInteractionCommand).
	('moveNode' -> TLNodeMovedCommand).
	('dropNode' -> TLDropNodeCommand).
	('externalTrigger' -> TLExternalTriggerCommand)} asDictionary at: (aJsonDictionary at: #command)) newWithParameters: aJsonDictionary
]

{ #category : #'instance creation' }
TLVisualizationClientsCommand class >> newWithParameters: aCollection [
	^ self subclassResponsibility
]

{ #category : #execution }
TLVisualizationClientsCommand >> executeOnVisu: aTLVisualization [
	self subclassResponsibility
]
