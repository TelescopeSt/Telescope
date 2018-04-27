"
Same as TLClickInteraction but activated only if shift is pressed when the user clicks on the drawable
"
Class {
	#name : #TLShiftClickInteraction,
	#superclass : #TLClickInteraction,
	#category : 'Telescope-Interactions'
}

{ #category : #generate }
TLShiftClickInteraction >> generateWith: aTLConnector on: aTLDrawable targeting: aTargetDrawable [
	aTLConnector generateShiftClickInteraction: self onDrawable: aTLDrawable targetingDrawable: aTargetDrawable
]
