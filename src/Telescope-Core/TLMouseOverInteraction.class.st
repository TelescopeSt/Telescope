"
A TLMooseOverInteraction is an interaction that will execute the action when the mouse is over the drawable. It will also execute it a second time when mouse will leave the drawable. Consequently the action must be a TLReversibleAction

"
Class {
	#name : #TLMouseOverInteraction,
	#superclass : #TLInteraction,
	#category : #'Telescope-Core-Interactions'
}

{ #category : #generate }
TLMouseOverInteraction >> generateWith: aTLConnector on: aTLDrawable targeting: aTargetDrawable [
	aTLConnector generateMouseOverInteraction: self onDrawable: aTLDrawable targetingDrawable: aTargetDrawable
]

{ #category : #testing }
TLMouseOverInteraction >> isMouseOver [
	^ true
]

{ #category : #accessor }
TLMouseOverInteraction >> kind [
	^ 'mouseOver'
]

{ #category : #action }
TLMouseOverInteraction >> reverseActionIfNecessaryOn: aDrawable [ 
	self action reverseActionIfNecessaryOn: aDrawable.
]

{ #category : #testing }
TLMouseOverInteraction >> shouldOccursOn: aKindOfInteraction with: aDrawable [
	^ (self kind = aKindOfInteraction or: [ #mouseOut = aKindOfInteraction ]) and: [ self condition value: aDrawable ]
]
