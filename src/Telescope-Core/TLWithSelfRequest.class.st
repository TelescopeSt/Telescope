"
I will add the asked drawable to the result.

example:
myVisus obtain withSelf nodes
will return all the visu nodes and the visu itself
"
Class {
	#name : #TLWithSelfRequest,
	#superclass : #TLRequest,
	#category : #'Telescope-Core-Model-Request'
}

{ #category : #iterating }
TLWithSelfRequest >> from: collection select: aBlockClosure into: selection [
	selection add: collection.
	self source from: collection select: aBlockClosure into: selection
]

{ #category : #iterating }
TLWithSelfRequest >> from: collection select: aSelectBlock thenDo: aDoBlock [
	aSelectBlock cull: collection.
	self from: collection select: aSelectBlock thenDo: aDoBlock
]
