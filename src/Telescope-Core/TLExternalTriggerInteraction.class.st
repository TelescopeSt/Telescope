"
I am an interaction launch by an external event like click on Button.
By default, I am inherit on all nodes.
"
Class {
	#name : #TLExternalTriggerInteraction,
	#superclass : #TLInteraction,
	#instVars : [
		'id'
	],
	#classInstVars : [
		'lastId'
	],
	#category : #'Telescope-Core-Interactions'
}

{ #category : #initialization }
TLExternalTriggerInteraction class >> initialize [
	lastId := 0
]

{ #category : #accessing }
TLExternalTriggerInteraction class >> lastId [
	^ lastId
]

{ #category : #accessing }
TLExternalTriggerInteraction class >> nextId [
	^ (lastId := self lastId + 1) asString
]

{ #category : #generate }
TLExternalTriggerInteraction >> generateWith: aTLConnector on: aTLDrawable targeting: anObject [
	aTLConnector generateExternalTriggerInteraction: self onDrawable: aTLDrawable targetingDrawable: anObject
]

{ #category : #initialization }
TLExternalTriggerInteraction >> initialize [
	super initialize.
	self inherited: true
]

{ #category : #accessor }
TLExternalTriggerInteraction >> kind [
	^ #externalTrigger
]

{ #category : #accessor }
TLExternalTriggerInteraction >> triggerId [
	^ id ifNil: [ id := self class nextId ]
]
