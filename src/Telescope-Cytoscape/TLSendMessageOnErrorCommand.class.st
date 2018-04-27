Class {
	#name : #TLSendMessageOnErrorCommand,
	#superclass : #TLErrorCommand,
	#category : 'Telescope-Cytoscape-Commands'
}

{ #category : #accessing }
TLSendMessageOnErrorCommand >> type [
	^ 'messageOnError'
]
