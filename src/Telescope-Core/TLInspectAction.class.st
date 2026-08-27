"
A TLInspectAction will just inspect entity.

"
Class {
	#name : 'TLInspectAction',
	#superclass : 'TLNodeAction',
	#category : 'Telescope-Core-Actions',
	#package : 'Telescope-Core',
	#tag : 'Actions'
}

{ #category : 'action' }
TLInspectAction >> actionOn: aNode [
	aNode entity inspect
]
