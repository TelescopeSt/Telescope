"
A TLInvalidPosition is send when the user provide a symbol that doesn't match a position.

"
Class {
	#name : #TLInvalidPositionException,
	#superclass : #Error,
	#category : 'Telescope-Exceptions'
}

{ #category : #'as yet unclassified' }
TLInvalidPositionException >> description [
	^ super description, ' (Valid positions are #top #bottom #left #right #inside)'
]

{ #category : #'as yet unclassified' }
TLInvalidPositionException >> initialize [
	super initialize.
	self messageText: 'Valid positions are #top #bottom #left #right #inside'
]
