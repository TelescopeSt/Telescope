"
I am an action that will receive a parameter in addition of the drawable when triggered. It can be a choice from a menu or an other drawable when drop action occurs.
"
Class {
	#name : #TLCustomWithParameterAction,
	#superclass : #TLActionWithParameter,
	#instVars : [
		'block'
	],
	#category : 'Telescope-Actions'
}

{ #category : #accessing }
TLCustomWithParameterAction class >> block: anActionBlockWithTwoArguments [
	^ self new block: anActionBlockWithTwoArguments 
]

{ #category : #'as yet unclassified' }
TLCustomWithParameterAction class >> block: anActionBlock condition: aConditionBlock [
	^ (self block: anActionBlock ) condition: aConditionBlock
]

{ #category : #action }
TLCustomWithParameterAction >> actionOn: aTLDrawable parameter: aChoiceResultObject [
	self block cull: aTLDrawable cull: aChoiceResultObject
]

{ #category : #accessing }
TLCustomWithParameterAction >> block [
	^ block
]

{ #category : #accessing }
TLCustomWithParameterAction >> block: anObject [
	block := anObject
]
