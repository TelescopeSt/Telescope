"
A TLReversibleNodeAction is an action that can be done and undone by calling a second time #actionOn:. It can be used like any action but is also sometime required for specific interation (like mooseOver)

"
Class {
	#name : #TLReversibleNodeAction,
	#superclass : #TLNodeAction,
	#category : #'Telescope-Core-Actions'
}

{ #category : #action }
TLReversibleNodeAction class >> onMouseOver [
	^ self new onMouseOver
]

{ #category : #action }
TLReversibleNodeAction class >> withTriggerStyled: aStyleOrStyleSheetCustomizationBlock thatBecome: anotherStyleOrStyleSheetCustomizationBlock [
	^ self new withTriggerStyled: aStyleOrStyleSheetCustomizationBlock thatBecome: anotherStyleOrStyleSheetCustomizationBlock
]

{ #category : #action }
TLReversibleNodeAction >> actionOn: aTLDrawable [
	(self shouldTriggerReverseActionFor: aTLDrawable)
		ifTrue: [ self reverseActionOn: aTLDrawable ]
		ifFalse: [ self regularActionOn: aTLDrawable ]
]

{ #category : #testing }
TLReversibleNodeAction >> isReversible [
	^ true
]

{ #category : #action }
TLReversibleNodeAction >> onMouseOver [
	^ TLMouseOverInteraction new action: self 
]

{ #category : #action }
TLReversibleNodeAction >> regularActionIfNecessaryOn: aTLDrawable [
	(self shouldTriggerReverseActionFor: aTLDrawable)
		ifFalse: [ self regularActionOn: aTLDrawable ]
]

{ #category : #action }
TLReversibleNodeAction >> regularActionOn: aTLDrawable [
	^ self subclassResponsibility 
]

{ #category : #action }
TLReversibleNodeAction >> reverseActionIfNecessaryOn: aTLDrawable [
	(self shouldTriggerReverseActionFor: aTLDrawable)
		ifTrue: [ self reverseActionOn: aTLDrawable ]
]

{ #category : #action }
TLReversibleNodeAction >> reverseActionOn: aTLDrawable [
	^ self subclassResponsibility 
]

{ #category : #testing }
TLReversibleNodeAction >> shouldTriggerReverseActionFor: aTLDrawable [
	self flag: 'only supported by Telescope-Cytoscape now and managed on the client side'.
	^ false
]

{ #category : #action }
TLReversibleNodeAction >> withTriggerStyled: aStyleOrStyleSheetCustomizationBlock thatBecome: anotherStyleOrStyleSheetCustomizationBlock [
	^ TLShapeInteraction new action: self; withTriggerStyled: aStyleOrStyleSheetCustomizationBlock thatBecome: anotherStyleOrStyleSheetCustomizationBlock
]
