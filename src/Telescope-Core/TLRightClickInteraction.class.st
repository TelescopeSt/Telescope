"
A TLRightClickInteraction is an interaction that is done on a rightClick.

"
Class {
	#name : #TLRightClickInteraction,
	#superclass : #TLInteraction,
	#category : #'Telescope-Core-Interactions'
}

{ #category : #generate }
TLRightClickInteraction >> generateWith: aTLConnector on: aTLDrawable targeting: aTargetDrawable [
	aTLConnector generateRightClickInteraction: self onDrawable: aTLDrawable targetingDrawable: aTargetDrawable
]

{ #category : #accessor }
TLRightClickInteraction >> kind [
	^ #rightClick
]
