"
I am an interaction that occurs when the node is moved by the user
"
Class {
	#name : #TLNodeMovedInteraction,
	#superclass : #TLInteraction,
	#category : #'Telescope-Core-Interactions'
}

{ #category : #action }
TLNodeMovedInteraction >> actionOn: aDrawable parameter: aPosition [
	self action actionOn: aDrawable parameter: aPosition
]

{ #category : #generate }
TLNodeMovedInteraction >> generateWith: aTLConnector on: aTLDrawable targeting: aTargetDrawable [
	aTLConnector generateMovedInteraction: self onDrawable: aTLDrawable targetingDrawable: aTargetDrawable
]

{ #category : #private }
TLNodeMovedInteraction >> kind [
	^ 'nodeMoved'
]
