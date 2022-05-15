Class {
	#name : #TLClientInteraction,
	#superclass : #TLInteraction,
	#instVars : [
		'eventType',
		'fctName'
	],
	#classInstVars : [
		'id'
	],
	#category : #'Telescope-Core-Interactions'
}

{ #category : #accessing }
TLClientInteraction class >> nextId [
	| result |
	id ifNil: [ id := 0 ].
	result := id.
	id := id + 1.
	^ id
]

{ #category : #accessing }
TLClientInteraction >> eventType [
	^ eventType
]

{ #category : #accessing }
TLClientInteraction >> eventType: anObject [
	eventType := anObject
]

{ #category : #generate }
TLClientInteraction >> generateWith: aTLConnector on: aTLDrawable targeting: aTargetDrawable [
	aTLConnector generateClientInteraction: self onDrawable: aTLDrawable targetingDrawable: aTargetDrawable
]

{ #category : #testing }
TLClientInteraction >> isClientSide [
	^ true
]

{ #category : #private }
TLClientInteraction >> kind [
	^ #client
]
