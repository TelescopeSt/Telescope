"
A TLDoubleClickInteraction is an interaction that is done on a double click.

"
Class {
	#name : #TLDoubleClickInteraction,
	#superclass : #TLInteraction,
	#category : #'Telescope-Core-Interactions'
}

{ #category : #generate }
TLDoubleClickInteraction >> generateWith: aTLConnector on: aTLDrawable targeting: aTargetDrawable [
	aTLConnector generateDoubleClickInteraction: self onDrawable: aTLDrawable targetingDrawable: aTargetDrawable
]

{ #category : #accessor }
TLDoubleClickInteraction >> kind [
	^ #doubleclick
]
