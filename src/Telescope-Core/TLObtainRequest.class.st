"
I am the core of the requesting on the telescope model.

I will be returned when on a composite or a node the #obtain message is sent
"
Class {
	#name : #TLObtainRequest,
	#superclass : #TLRequest,
	#instVars : [
		'strategies'
	],
	#category : #'Telescope-Core-Model-Request'
}

{ #category : #final }
TLObtainRequest >> all [
	^ self source copy
]

{ #category : #scope }
TLObtainRequest >> compositeRecursively [
	^ TLCompositeRecursiveRequest source: self
]

{ #category : #scope }
TLObtainRequest >> groupRecursively [
	^ TLGroupRecursiveRequest source: self
]

{ #category : #'as yet unclassified' }
TLObtainRequest >> initialize [
	super initialize.
	self strategies: OrderedCollection new
]

{ #category : #scope }
TLObtainRequest >> recursively [
	^ TLRecursiveRequest source: self
]

{ #category : #accessing }
TLObtainRequest >> rootSource [
	^ self source
]

{ #category : #iterating }
TLObtainRequest >> sourceSelect: aSelectBlock [
	^ self source select: (self addStrategiesToBlock: aSelectBlock)
]

{ #category : #accessing }
TLObtainRequest >> strategies [
	^ strategies
]

{ #category : #accessing }
TLObtainRequest >> strategies: anObject [
	strategies := anObject
]
