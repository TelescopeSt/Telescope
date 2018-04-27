"
I am an action that will receive in addition of the drawable a choice by the user. I will act depending on this choice
"
Class {
	#name : #TLActionWithParameter,
	#superclass : #TLDrawableAction,
	#category : 'Telescope-Actions'
}

{ #category : #interactions }
TLActionWithParameter class >> withMultipleChoices: aBlockOrCollection	menu: aTitle [
	^ self new withMultipleChoices: aBlockOrCollection	menu: aTitle
]

{ #category : #action }
TLActionWithParameter >> actionOn: aTLDrawable [
	self shouldNotImplement 
]

{ #category : #action }
TLActionWithParameter >> actionOn: aTLDrawable parameter: aChoiceResultObject [ 
	self subclassResponsibility 
]

{ #category : #testing }
TLActionWithParameter >> isMultiChoiceAction [
	^ true
]

{ #category : #interactions }
TLActionWithParameter >> onDrop [
	^ TLDropInteraction new action: self 
]

{ #category : #interactions }
TLActionWithParameter >> withMultipleChoices: aBlockOrCollection	menu: aTitle [
	^ TLMultiChoiceMenuInteraction new title: aTitle; choicesBlock: aBlockOrCollection; action: self 
]

{ #category : #interactions }
TLActionWithParameter >> withMultipleChoices: aBlockOrCollection menu: aTitle displayBlock: aBlock [
	^ (self withMultipleChoices: aBlockOrCollection menu: aTitle)
		displayBlock: aBlock;
		yourself
]
