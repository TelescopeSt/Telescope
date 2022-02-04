"
A TLClickInteraction is an interaction that is done on a click.

"
Class {
	#name : #TLClickInteraction,
	#superclass : #TLInteraction,
	#category : #'Telescope-Core-Interactions'
}

{ #category : #generate }
TLClickInteraction >> generateWith: aTLConnector on: aTLDrawable targeting: aTargetDrawable [
	aTLConnector generateClickInteraction: self onDrawable: aTLDrawable targetingDrawable: aTargetDrawable
]

{ #category : #accessor }
TLClickInteraction >> kind [
	^ #click
]
