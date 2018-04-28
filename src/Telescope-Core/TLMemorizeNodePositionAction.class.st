"
I am an action that will make the node to keep its relative position to its parent when triggered. Layout will now stop to place the node but will count it for positionning the others
"
Class {
	#name : #TLMemorizeNodePositionAction,
	#superclass : #TLDrawableAction,
	#category : #'Telescope-Core-Actions'
}

{ #category : #action }
TLMemorizeNodePositionAction >> actionOn: aDrawable [
	self error: 'This action can only be used with a move node action'
]

{ #category : #action }
TLMemorizeNodePositionAction >> actionOn: aDrawable parameter: aPosition [
	(aDrawable generator elementFromTLDrawable: aDrawable)
		in: [ :anElement | anElement defineFixedRelativePosition: aPosition ]
]
