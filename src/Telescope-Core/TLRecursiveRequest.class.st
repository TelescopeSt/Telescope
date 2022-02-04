"
I will apply the request recursively on all the asked drawable tree, through composites and groups
"
Class {
	#name : #TLRecursiveRequest,
	#superclass : #TLRequest,
	#category : #'Telescope-Core-Model-Request'
}

{ #category : #iterating }
TLRecursiveRequest >> from: collection select: aBlockClosure into: selection [
	collection
		do: [ :aDrawable | 
			(aBlockClosure value: aDrawable)
				ifTrue: [ selection add: aDrawable ].
			aDrawable isGroup
				ifTrue: [ self from: aDrawable select: aBlockClosure into: selection ].
			(aDrawable isCompositeNode and: [ self compositeDeserveVisit: aDrawable ])
				ifTrue: [ self from: aDrawable childrenGroup select: aBlockClosure into: selection ] ]
]

{ #category : #iterating }
TLRecursiveRequest >> from: collection select: aSelectBlock thenDo: aDoBlock [
	collection
		do: [ :aDrawable | 
			(aSelectBlock value: aDrawable)
				ifTrue: [ aDoBlock cull: aDrawable ].
			aDrawable isGroup
				ifTrue: [ self from: aDrawable select: aSelectBlock thenDo: aDoBlock ].
			(aDrawable isCompositeNode and: [ self compositeDeserveVisit: aDrawable ])
				ifTrue: [ self from: aDrawable childrenGroup select: aSelectBlock thenDo: aDoBlock ] ]
]
