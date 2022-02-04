"
I am an interaction that occurs when another drawable is dropped on me
"
Class {
	#name : #TLDropInteraction,
	#superclass : #TLInteraction,
	#category : #'Telescope-Core-Interactions'
}

{ #category : #action }
TLDropInteraction >> actionOn: aTLDrawable parameter: anotherTLDrawable [
	self action actionOn: aTLDrawable parameter: anotherTLDrawable
]

{ #category : #generate }
TLDropInteraction >> generateWith: aTLConnector on: aTLDrawable targeting: aTargetDrawable [ 
	aTLConnector generateDropInteraction: self onDrawable: aTLDrawable targetingDrawable: aTargetDrawable
]

{ #category : #testing }
TLDropInteraction >> isDrop [
	^ true
]

{ #category : #private }
TLDropInteraction >> kind [
	^ #drop
]
