"
A TLCustomAction is a generic action where the provided block will be executed with the TLDrawable as parameter.

Instance Variables
	actionBlock:		<Object>

actionBlock
	- xxxxx

"
Class {
	#name : #TLCustomAction,
	#superclass : #TLDrawableAction,
	#instVars : [
		'actionBlock'
	],
	#category : #'Telescope-Core-Actions'
}

{ #category : #accessing }
TLCustomAction class >> block: anActionBlock [
	^ self new actionBlock: anActionBlock 
]

{ #category : #'instance creation' }
TLCustomAction class >> block: anActionBlock condition: aConditionBlock [
	^ (self block: anActionBlock ) condition: aConditionBlock
]

{ #category : #accessing }
TLCustomAction >> actionBlock [
	^ actionBlock
]

{ #category : #accessing }
TLCustomAction >> actionBlock: anObject [
	actionBlock := anObject
]

{ #category : #action }
TLCustomAction >> actionOn: aTLDrawable [
	self actionBlock value: aTLDrawable 
]
