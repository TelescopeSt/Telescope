"
Same as TLMooseOverInteraction but activeated only if shift is pressed when the mouse is over the drawable.
"
Class {
	#name : #TLShiftMouseOverInteraction,
	#superclass : #TLMouseOverInteraction,
	#category : 'Telescope-Interactions'
}

{ #category : #generate }
TLShiftMouseOverInteraction >> generateWith: aTLConnector on: aTLDrawable targeting: aTargetDrawable [
	aTLConnector generateShiftMouseOverInteraction: self onDrawable: aTLDrawable targetingDrawable: aTargetDrawable
]
