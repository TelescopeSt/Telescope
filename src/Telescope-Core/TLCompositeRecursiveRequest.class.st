"
I will apply the request recursively through composites. I will stop if i encounter a leaf or a group
"
Class {
	#name : #TLCompositeRecursiveRequest,
	#superclass : #TLRequest,
	#category : #'Telescope-Core-Model-Request'
}

{ #category : #iterating }
TLCompositeRecursiveRequest >> from: collection select: aBlockClosure into: selection [
	collection
		do: [ :aDrawable | 
			(aBlockClosure value: aDrawable)
				ifTrue: [ selection add: aDrawable ].
			(aDrawable isCompositeNode and: [ self compositeDeserveVisit: aDrawable ])
				ifTrue: [ self from: aDrawable childrenGroup select: aBlockClosure into: selection ] ]
]

{ #category : #iterating }
TLCompositeRecursiveRequest >> from: collection select: aSelectBlock thenDo: aDoBlock [
	collection
		do: [ :aDrawable | 
			(aSelectBlock value: aDrawable)
				ifTrue: [ aDoBlock cull: aDrawable ].
			(aDrawable isCompositeNode and: [ self compositeDeserveVisit: aDrawable ])
				ifTrue: [ self from: aDrawable childrenGroup select: aSelectBlock thenDo: aDoBlock ] ]
]
