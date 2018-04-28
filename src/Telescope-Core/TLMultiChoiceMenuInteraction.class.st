"
A TLMultiChoiceMenuInteraction is an interaction that is accessible from a menu entry that will provide a submenu proposing choices for the action. It requires a specific action (TLMultiChoiceAction) that will be triggered will the drawable and the choice.
"
Class {
	#name : #TLMultiChoiceMenuInteraction,
	#superclass : #TLMenuInteraction,
	#instVars : [
		'choicesBlock',
		'displayBlock'
	],
	#category : #'Telescope-Core-Interactions'
}

{ #category : #accessing }
TLMultiChoiceMenuInteraction >> action: aTLAction [
	self assert: aTLAction isMultiChoiceAction description: 'A TLMultiChoiceMenuInteraction require a TLMultiChoiceAction'.
	super action: aTLAction
]

{ #category : #action }
TLMultiChoiceMenuInteraction >> actionOn: anotherDrawable parameter: entity [
	self action actionOn: anotherDrawable parameter: entity.
]

{ #category : #accessing }
TLMultiChoiceMenuInteraction >> choicesBlock [
	^ choicesBlock
]

{ #category : #accessing }
TLMultiChoiceMenuInteraction >> choicesBlock: anObject [
	choicesBlock := anObject
]

{ #category : #'as yet unclassified' }
TLMultiChoiceMenuInteraction >> choicesListForDrawable: aTLDrawable [
	^ self choicesBlock cull: aTLDrawable
]

{ #category : #accessing }
TLMultiChoiceMenuInteraction >> displayBlock [
	^ displayBlock ifNil: [#asString]
]

{ #category : #accessing }
TLMultiChoiceMenuInteraction >> displayBlock: anObject [
	displayBlock := anObject
]

{ #category : #generate }
TLMultiChoiceMenuInteraction >> generateWith: aTLConnector on: aTLDrawable targeting: anotherDrawable [
	aTLConnector generateMultiChoiceMenuInteraction: self onDrawable: aTLDrawable targeting: anotherDrawable
]

{ #category : #initialization }
TLMultiChoiceMenuInteraction >> initialize [
	super initialize.
	self displayBlock: [ :e | e asString ]
]

{ #category : #testing }
TLMultiChoiceMenuInteraction >> isMultiChoiceMenu [
	^ true
]
