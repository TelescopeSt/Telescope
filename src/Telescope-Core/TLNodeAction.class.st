"
A TLNodeAction is the abstract superclass for every action that can only be performed on a TLNode.

"
Class {
	#name : #TLNodeAction,
	#superclass : #TLDrawableAction,
	#category : #'Telescope-Core-Actions'
}

{ #category : #testing }
TLNodeAction class >> isAbstract [
	^ self = TLNodeAction
]
