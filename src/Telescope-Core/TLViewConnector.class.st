"
TLViewConnector is an abstract class that will manage a generic rendering known as view. 
"
Class {
	#name : #TLViewConnector,
	#superclass : #TLConnector,
	#instVars : [
		'view'
	],
	#category : #'Telescope-Core-Connector'
}

{ #category : #accessing }
TLViewConnector class >> priority [
	^ -100
]

{ #category : #accessing }
TLViewConnector >> view [
	^ view ifNil: [ view := self configView ]
]

{ #category : #accessing }
TLViewConnector >> view: anObject [
	view := anObject
]
