"
I am the abstract superclass for all error commands sent to the client
"
Class {
	#name : #TLErrorCommand,
	#superclass : #TLVisualizationCommand,
	#instVars : [
		'error',
		'message'
	],
	#category : 'Telescope-Cytoscape-Commands'
}

{ #category : #'instance creation' }
TLErrorCommand class >> new: id withError: anError on: aSocket [
	self new
		visuId: id;
		errorObject: anError;
		sendCommandOn: aSocket.
]

{ #category : #accessing }
TLErrorCommand >> errorObject [
	^ error
]

{ #category : #accessing }
TLErrorCommand >> errorObject: anError [
	error:= anError
]

{ #category : #accessing }
TLErrorCommand >> message [
	^ message ifNil:[ self errorObject messageText ]
]

{ #category : #accessing }
TLErrorCommand >> message: aString [
  message:= aString
]

{ #category : #action }
TLErrorCommand >> sendCommandOn: aWebSocket [
	aWebSocket
		sendMessage:
			(NeoJSONWriter
				toString:
					{{(#command -> 'error').
					(#visuId -> self visuId).
					(#detail -> self type).
					(#message -> self message)} asDictionary})
]

{ #category : #accessing }
TLErrorCommand >> type [
	^ 'generic'
]
