Class {
	#name : #TLClientAction,
	#superclass : #TLDrawableAction,
	#instVars : [
		'scriptDSL',
		'eventType'
	],
	#category : #'Telescope-Core-Actions'
}

{ #category : #accessing }
TLClientAction class >> scriptDSL: anObject [
	^ self new
		scriptDSL: anObject;
		yourself
]

{ #category : #sugar }
TLClientAction >> onMouseClick [
	^ TLClickInteraction new
		action: self;
		eventType: TLClientEvent mouseClick;
		yourself
]

{ #category : #sugar }
TLClientAction >> onMouseDbClick [
	^ TLClickInteraction new
		action: self;
		eventType: TLClientEvent mouseDbClick;
		yourself
]

{ #category : #sugar }
TLClientAction >> onMouseDown [
	^ TLClickInteraction new
		action: self;
		eventType: TLClientEvent mouseDown;
		yourself
]

{ #category : #sugar }
TLClientAction >> onMouseEnter [
	^ TLClickInteraction new
		action: self;
		eventType: TLClientEvent mouseEnter;
		yourself
]

{ #category : #sugar }
TLClientAction >> onMouseLeave [
	^ TLClickInteraction new
		action: self;
		eventType: TLClientEvent mouseLeave;
		yourself
]

{ #category : #sugar }
TLClientAction >> onMouseOut [
	^ TLClientInteraction new
		action: self;
		eventType: TLClientEvent mouseOut;
		yourself
]

{ #category : #sugar }
TLClientAction >> onMouseOver [
	^ TLClientInteraction new
		action: self;
		eventType: TLClientEvent mouseOver;
		yourself
]

{ #category : #sugar }
TLClientAction >> onMouseUp [
	^ TLClickInteraction new
		action: self;
		eventType: TLClientEvent mouseUp;
		yourself
]

{ #category : #accessing }
TLClientAction >> scriptDSL [
	^ scriptDSL
]

{ #category : #accessing }
TLClientAction >> scriptDSL: anObject [
	scriptDSL := anObject
]

{ #category : #'as yet unclassified' }
TLClientAction >> scriptDSLAsJs [
	^ self scriptDSL 
]
