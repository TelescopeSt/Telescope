"
A TLAction is superclass for all actions on TLDrawable in Telescope..

Instance Variables
	condition:		<Object>

condition
	- xxxxx

"
Class {
	#name : #TLAction,
	#superclass : #TLObject,
	#instVars : [
		'condition'
	],
	#category : #'Telescope-Core-Actions'
}

{ #category : #accessing }
TLAction class >> condition: aConditionBlock [
	^ self new condition: aConditionBlock; yourself
]

{ #category : #testing }
TLAction class >> isAbstract [
	^ self = TLAction
]

{ #category : #accessing }
TLAction >> condition [
	^ condition ifNil: [ [ :n | true ] ]
]

{ #category : #accessing }
TLAction >> condition: anObject [
	condition := anObject
]

{ #category : #error }
TLAction >> container: aTLDrawable [ 
	self error: 'An action cannot be added as an Interaction, please transform your action in interaction by using one of the #interactions protocol method (like #onClick)'
]

{ #category : #testing }
TLAction >> isMultiChoiceAction [
	^ false
]

{ #category : #testing }
TLAction >> isPopUp [
	^ false
]

{ #category : #testing }
TLAction >> isReversible [
	^ false
]
