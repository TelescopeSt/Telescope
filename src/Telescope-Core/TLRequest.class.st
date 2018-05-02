"
I am the abstract class for all requests on Telescope model.
My starting point must be a TLObtainRequest and you can get it by sending #obtain on any Telescope collection or group.

Then you can use any combination you want but must not use more than one iterating method and nothing after a final method (following protocols). You can use as many strategies as you want
"
Class {
	#name : #TLRequest,
	#superclass : #TLObject,
	#instVars : [
		'source'
	],
	#category : #'Telescope-Core-Model-Request'
}

{ #category : #'instance creation' }
TLRequest class >> source: aTLDrawableCollection [
	^ self new
		source: aTLDrawableCollection;
		yourself
]

{ #category : #iterating }
TLRequest >> addStrategiesToBlock: aBlockClosure [
	^ [ :anEntity | (aBlockClosure value: anEntity) and: [ self strategies allSatisfy: [ :aStrategy | aStrategy validate: anEntity ] ] ]
]

{ #category : #final }
TLRequest >> all [
	^ self sourceSelect: [ :drawable | true ]
]

{ #category : #optimisation }
TLRequest >> compositeDeserveVisit: aTLCompositeNode [
	^ (self strategies allSatisfy: #ignoreVisibility) or: [ aTLCompositeNode expanded ]
]

{ #category : #final }
TLRequest >> compositeNodes [
	^ self sourceSelect: [ :drawable | drawable isNode and: [ drawable isComposite ] ]
]

{ #category : #finalIteration }
TLRequest >> compositeNodesDo: aBlockClosure [
	^ self sourceSelect: [ :drawable | drawable isNode and: [ drawable isComposite ] ] thenDo: aBlockClosure
]

{ #category : #finalIteration }
TLRequest >> compositeNodesSelect: aBlockClosure [
	^ self
		sourceSelect: (self selectBlockFrom: aBlockClosure and: [ :drawable | drawable isNode and: [ drawable isComposite ] ])
]

{ #category : #final }
TLRequest >> groups [
	^ self sourceSelect: #isGroup
]

{ #category : #finalIteration }
TLRequest >> groupsDo: aBlockClosure [
	^ self sourceSelect: #isGroup thenDo: aBlockClosure
]

{ #category : #finalIteration }
TLRequest >> groupsSelect: aBlockClosure [
	^ self sourceSelect: (self selectBlockFrom: aBlockClosure and: #isGroup)
]

{ #category : #strategies }
TLRequest >> lowestVisibles [
	self strategies add: TLLowestVisibleStrategy.
]

{ #category : #final }
TLRequest >> nodes [
	^ self sourceSelect: #isNode.
]

{ #category : #finalIteration }
TLRequest >> nodesDo: aBlockClosure [
	self sourceSelect: #isNode thenDo: aBlockClosure
]

{ #category : #finalIteration }
TLRequest >> nodesSelect: aBlockClosure [
	^ self sourceSelect: (self selectBlockFrom: aBlockClosure and: #isNode)
]

{ #category : #accessing }
TLRequest >> rootSource [
	^ self source rootSource
]

{ #category : #private }
TLRequest >> selectBlockFrom: aBlockClosure and: aTypeBlock [
	^ [ :drawable | (aTypeBlock cull: drawable) and: [ aBlockClosure cull: drawable ] ]
]

{ #category : #final }
TLRequest >> simpleNodes [
	^ self sourceSelect: [ :drawable | drawable isNode and: [ drawable isComposite not ] ]
]

{ #category : #finalIteration }
TLRequest >> simpleNodesDo: aBlockClosure [
	^ self sourceSelect: [ :drawable | drawable isNode and: [ drawable isComposite not ] ] thenDo: aBlockClosure
]

{ #category : #finalIteration }
TLRequest >> simpleNodesSelect: aBlockClosure [
	^ self
		sourceSelect:
			(self selectBlockFrom: aBlockClosure and: [ :drawable | drawable isNode and: [ drawable isComposite not ] ])
]

{ #category : #accessing }
TLRequest >> source [
	^ source
]

{ #category : #accessing }
TLRequest >> source: anObject [
	source := anObject
]

{ #category : #iterating }
TLRequest >> sourceSelect: aBlockClosure [
	| selection |
	selection := TLDrawableCollection new.
	self from: self rootSource select: (self addStrategiesToBlock: aBlockClosure) into: selection.
	^ selection
]

{ #category : #iterating }
TLRequest >> sourceSelect: aSelectionBlock thenDo: aDoBlock [
	| selection |
	selection := TLDrawableCollection new.
	self from: self rootSource select: (self addStrategiesToBlock: aSelectionBlock) thenDo: aDoBlock.
	^ selection
]

{ #category : #accessing }
TLRequest >> strategies [
	^ self source strategies
]

{ #category : #strategies }
TLRequest >> visibles [
	self strategies add: TLRequestStrategyOnlyVisible
]

{ #category : #inclusion }
TLRequest >> withSelf [
	^ TLWithSelfRequest source: self
]
