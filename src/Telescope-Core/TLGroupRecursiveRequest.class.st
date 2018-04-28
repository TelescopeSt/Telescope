"
I will apply the request recursively through groups. I will stop if i encounter a leaf or a composite
"
Class {
	#name : #TLGroupRecursiveRequest,
	#superclass : #TLRequest,
	#category : #'Telescope-Core-Model-Request'
}

{ #category : #iterating }
TLGroupRecursiveRequest >> from: collection select: aBlockClosure into: selection [
	collection
		do: [ :aDrawable | 
			(aBlockClosure value: aDrawable)
				ifTrue: [ selection add: aDrawable ].
			aDrawable isGroup
				ifTrue: [ self from: aDrawable select: aBlockClosure into: selection ] ]
]

{ #category : #iterating }
TLGroupRecursiveRequest >> from: collection select: aSelectBlock thenDo: aDoBlock [
	collection
		do: [ :aDrawable | 
			(aSelectBlock value: aDrawable)
				ifTrue: [ aDoBlock cull: aDrawable ].
			aDrawable isGroup
				ifTrue: [ self from: aDrawable select: aSelectBlock thenDo: aDoBlock ] ]
]
