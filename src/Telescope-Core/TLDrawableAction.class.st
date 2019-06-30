"
A TLAction is the superclass for all actions without parameters on TLDrawable in Telescope.

Instance Variables
	condition:		<Object>

condition
	- xxxxx

"
Class {
	#name : #TLDrawableAction,
	#superclass : #TLAction,
	#category : #'Telescope-Core-Actions'
}

{ #category : #interactions }
TLDrawableAction class >> onClick [
	^ self new onClick
]

{ #category : #interactions }
TLDrawableAction class >> onDoubleClick [
	^ self new onDoubleClick
]

{ #category : #interactions }
TLDrawableAction class >> onExternalTrigger [
	^ self new onExternalTrigger
]

{ #category : #interactions }
TLDrawableAction class >> onMove [
	^ self new onMove
]

{ #category : #interactions }
TLDrawableAction class >> onRightClick [
	^ self new onRightClick
]

{ #category : #interactions }
TLDrawableAction class >> withMenu: aTitle [
	^ self new withMenu: aTitle
]

{ #category : #interactions }
TLDrawableAction class >> withShape: aShape [
	^ self new withShape: aShape
]

{ #category : #interactions }
TLDrawableAction class >> withTriggerStyle: aSymbolOrBlockClosure [ 
	^ self new withTriggerStyle: aSymbolOrBlockClosure
]

{ #category : #action }
TLDrawableAction >> actionOn: aTLDrawable [
	self subclassResponsibility 
]

{ #category : #action }
TLDrawableAction >> actionOn: aTLDrawable parameter: aParameter [
	self actionOn: aTLDrawable
]

{ #category : #interactions }
TLDrawableAction >> onClick [
	^ TLClickInteraction new action: self 
]

{ #category : #interactions }
TLDrawableAction >> onDoubleClick [
	^ TLDoubleClickInteraction new action: self 
]

{ #category : #interactions }
TLDrawableAction >> onExternalTrigger [
	^ TLExternalTriggerInteraction new action: self 
]

{ #category : #interactions }
TLDrawableAction >> onMove [
	^ TLNodeMovedInteraction new action: self 
]

{ #category : #interactions }
TLDrawableAction >> onRightClick [
	^ TLRightClickInteraction new action: self 
]

{ #category : #interactions }
TLDrawableAction >> onShiftMouseOver [
	self deprecated: 'This option never work because it calls unimplemented code. It will be removed.'
]

{ #category : #action }
TLDrawableAction >> regularActionIfNecessaryOn: aTLDrawable [
	"The default behavior is to always perform action"
	self actionOn: aTLDrawable
]

{ #category : #'multi-visus' }
TLDrawableAction >> updateAlso: aDrawable [
	^ TLUpdateAction drawable: aDrawable action: self 
]

{ #category : #interactions }
TLDrawableAction >> withMenu: aTitle [
	^ TLMenuInteraction new title: aTitle; action: self 
]

{ #category : #interactions }
TLDrawableAction >> withShape: aShape [
	^ TLShapeInteraction new action: self; shape: aShape
]

{ #category : #interactions }
TLDrawableAction >> withTriggerStyle: aSymbolOrBlockClosure [ 
	^ TLShapeInteraction new action: self; withTriggerStyle: aSymbolOrBlockClosure
]
