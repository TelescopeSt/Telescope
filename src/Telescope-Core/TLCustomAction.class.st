"
A TLCustomAction is a generic action where the provided block will be executed with the TLDrawable as parameter.

It can also have a reverse block, evaluated with the same TLDrawable when the action is reversed. The reverse block is what a TLMouseOverInteraction evaluates when the mouse leaves the drawable: the action block is evaluated when the mouse enters it. Without a reverse block, there is nothing to do when the mouse leaves.

Instance Variables
	actionBlock:		<BlockClosure> evaluated with the drawable when the action is done
	reverseBlock:		<BlockClosure or nil> evaluated with the drawable when the action is reversed
"
Class {
	#name : 'TLCustomAction',
	#superclass : 'TLDrawableAction',
	#instVars : [
		'actionBlock',
		'reverseBlock'
	],
	#category : 'Telescope-Core-Actions',
	#package : 'Telescope-Core',
	#tag : 'Actions'
}

{ #category : 'accessing' }
TLCustomAction class >> block: anActionBlock [
	^ self new actionBlock: anActionBlock 
]

{ #category : 'instance creation' }
TLCustomAction class >> block: anActionBlock condition: aConditionBlock [
	^ (self block: anActionBlock ) condition: aConditionBlock
]

{ #category : 'instance creation' }
TLCustomAction class >> block: anActionBlock reverseBlock: aReverseBlock [
	"The reverse block is evaluated with the drawable when the action is reversed, for example when the mouse leaves the drawable of a TLMouseOverInteraction"

	^ (self block: anActionBlock)
		  reverseBlock: aReverseBlock;
		  yourself
]

{ #category : 'accessing' }
TLCustomAction >> actionBlock [
	^ actionBlock
]

{ #category : 'accessing' }
TLCustomAction >> actionBlock: anObject [
	actionBlock := anObject
]

{ #category : 'action' }
TLCustomAction >> actionOn: aTLDrawable [
	self actionBlock value: aTLDrawable 
]

{ #category : 'testing' }
TLCustomAction >> isReversible [

	^ reverseBlock isNotNil
]

{ #category : 'instance creation' }
TLCustomAction >> onMouseOver [
	"The action is done when the mouse enters the drawable, and its reverse block is evaluated when the mouse leaves it"

	^ TLMouseOverInteraction new action: self
]

{ #category : 'action' }
TLCustomAction >> reverseActionIfNecessaryOn: aTLDrawable [

	self reverseActionOn: aTLDrawable
]

{ #category : 'action' }
TLCustomAction >> reverseActionOn: aTLDrawable [

	reverseBlock ifNotNil: [ :block | block value: aTLDrawable ]
]

{ #category : 'action' }
TLCustomAction >> reverseBlock [

	^ reverseBlock
]

{ #category : 'action' }
TLCustomAction >> reverseBlock: aBlock [

	reverseBlock := aBlock
]
