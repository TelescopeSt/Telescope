Class {
	#name : #TLExternalTriggerCommand,
	#superclass : #TLVisualizationClientsCommand,
	#instVars : [
		'triggerId'
	],
	#category : 'Telescope-Cytoscape-Commands'
}

{ #category : #'as yet unclassified' }
TLExternalTriggerCommand class >> newWithParameters: aParametersDictionary [
	^ self new
		visuId: (aParametersDictionary at: #id);
		triggerId: (aParametersDictionary at: #triggerId);
		yourself
]

{ #category : #'as yet unclassified' }
TLExternalTriggerCommand >> executeOnVisu: aTLVisualization [
	aTLVisualization generator executeExternalTrigger: self triggerId .
]

{ #category : #'as yet unclassified' }
TLExternalTriggerCommand >> triggerId [
	^ triggerId
]

{ #category : #'as yet unclassified' }
TLExternalTriggerCommand >> triggerId: anID [
	triggerId := anID
]
