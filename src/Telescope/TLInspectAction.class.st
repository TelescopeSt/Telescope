"
A TLInspectAction will just inspect entity.

"
Class {
	#name : #TLInspectAction,
	#superclass : #TLNodeAction,
	#category : 'Telescope-Actions'
}

{ #category : #'as yet unclassified' }
TLInspectAction >> actionOn: aNode [
	aNode entity inspect
]
