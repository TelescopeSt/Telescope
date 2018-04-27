Class {
	#name : #TLGenerationErrorCommand,
	#superclass : #TLErrorCommand,
	#category : 'Telescope-Cytoscape-Commands'
}

{ #category : #'instance creation' }
TLGenerationErrorCommand class >> new: id withMessage: anError on: aSocket [
	self new
		visuId: id;
		message: anError;
		sendCommandOn: aSocket.
]

{ #category : #accessing }
TLGenerationErrorCommand >> type [
	^ 'noVisu'
]
