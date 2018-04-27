"
A TLMenuInteraction is an interaction that is accessible from a menu entry.

Instance Variables
	title:		<Object>

title
	- xxxxx

"
Class {
	#name : #TLMenuInteraction,
	#superclass : #TLInteraction,
	#instVars : [
		'title'
	],
	#category : 'Telescope-Interactions'
}

{ #category : #generate }
TLMenuInteraction >> generateWith: aTLConnector on: aTLDrawable targeting: aTargetDrawable [
	aTLConnector generateMenuInteraction: self onDrawable: aTLDrawable targetingDrawable: aTargetDrawable
]

{ #category : #testing }
TLMenuInteraction >> isMenu [
	^ true
]

{ #category : #testing }
TLMenuInteraction >> isMultiChoiceMenu [
	^ false
]

{ #category : #accessor }
TLMenuInteraction >> kind [
	^ #menu
]

{ #category : #accessing }
TLMenuInteraction >> title [
	^ title
]

{ #category : #accessing }
TLMenuInteraction >> title: anObject [
	title := anObject
]
