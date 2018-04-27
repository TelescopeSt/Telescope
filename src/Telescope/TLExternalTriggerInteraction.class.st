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
		'id'
	],
	#category : 'Telescope-Interactions'
}

{ #category : #'as yet unclassified' }
TLExternalTriggerInteraction class >> generateId [
	id ifNil: [ id := 0 ].
	^ (id := id + 1) asString
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
	^ id ifNil:[ id:= TLExternalTriggerInteraction generateId ]
]
