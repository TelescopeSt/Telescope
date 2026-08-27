"
I am the superclass for all request strategies.

Those strategies will restrain the source to a caracteristic (only visible elements...)
"
Class {
	#name : 'TLRequestStrategy',
	#superclass : 'TLObject',
	#category : 'Telescope-Core-Model-Request',
	#package : 'Telescope-Core',
	#tag : 'Model-Request'
}

{ #category : 'optimisation' }
TLRequestStrategy class >> ignoreVisibility [
	^ true
]

{ #category : 'strategy' }
TLRequestStrategy class >> validate: aDrawable [
	^ self subclassResponsibility
]
