"
TLNodeCreationStrategy is a strategy that express how to create nodes
"
Class {
	#name : #TLNodeCreationStrategy,
	#superclass : #TLBuildingStrategy,
	#instVars : [
		'childrenStrategy',
		'compositeProperty',
		'compositeChildrenLayout',
		'nodeStyle',
		'childrenSortingStrategy'
	],
	#category : #'Telescope-Core-Strategies'
}

{ #category : #'instance-creation' }
TLNodeCreationStrategy class >> composite: aCompositeProperty [
	^ self new
		compositeProperty: aCompositeProperty;
		yourself
]

{ #category : #'instance-creation' }
TLNodeCreationStrategy class >> composite: aCompositeProperty withLayout: aLayout [
	^ (self composite: aCompositeProperty)
		compositeChildrenLayout: aLayout;
		yourself
]

{ #category : #'instance-creation' }
TLNodeCreationStrategy class >> default [
	^ self new
]

{ #category : #'instance-creation' }
TLNodeCreationStrategy class >> recursiveComposite: aCompositeProperty withLayout: aLayout [
	^ (self composite: aCompositeProperty withLayout: aLayout)
		beRecursive;
		yourself
]

{ #category : #children }
TLNodeCreationStrategy >> beRecursive [
	self childrenStrategy: self
]

{ #category : #'as yet unclassified' }
TLNodeCreationStrategy >> childrenProperty: aString [ 
	self flag: 'Only one should remain'.
	^ self compositeProperty: aString
]

{ #category : #accessing }
TLNodeCreationStrategy >> childrenSortingStrategy [
	^ childrenSortingStrategy
]

{ #category : #accessing }
TLNodeCreationStrategy >> childrenSortingStrategy: anObject [
	childrenSortingStrategy := anObject
]

{ #category : #accessing }
TLNodeCreationStrategy >> childrenStrategy [
	^ childrenStrategy
]

{ #category : #accessing }
TLNodeCreationStrategy >> childrenStrategy: anObject [
	childrenStrategy := anObject
]

{ #category : #accessing }
TLNodeCreationStrategy >> compositeChildrenLayout [
	^ compositeChildrenLayout
]

{ #category : #accessing }
TLNodeCreationStrategy >> compositeChildrenLayout: anObject [
	compositeChildrenLayout := anObject
]

{ #category : #accessing }
TLNodeCreationStrategy >> compositeNodesFrom: aValuableOrCollection [
	self compositeProperty: aValuableOrCollection
]

{ #category : #accessing }
TLNodeCreationStrategy >> compositeProperty [
	^ compositeProperty
]

{ #category : #accessing }
TLNodeCreationStrategy >> compositeProperty: anObject [
	compositeProperty := anObject.
	anObject ifNotNil: [ self childrenStrategy ifNil: [ self childrenStrategy: self class default ] ].
	^ self childrenStrategy
]

{ #category : #'as yet unclassified' }
TLNodeCreationStrategy >> copyAsSimpleStrategy [
	"this works because we do not have other properties than composite. This is planned for future evolution to avoid duplication"

	^ self copy
		childrenStrategy: nil;
		compositeProperty: nil;
		yourself
]

{ #category : #'node-creation' }
TLNodeCreationStrategy >> createNodeFromEntity: anEntity [
	| node |
	node := self requireCompositeCreation
		ifTrue: [ 
			TLCompositeNode
				withEntity: anEntity
				childrenProperty: self compositeProperty
				childrenNodeCreationStrategy: self childrenStrategy ]
		ifFalse: [ TLSimpleNode withEntity: anEntity ].
	self customizeNode: node.
	^ node
]

{ #category : #'node-creation' }
TLNodeCreationStrategy >> customizeNode: node [
	(node isComposite and: self compositeChildrenLayout notNil)
		ifTrue: [ node childrenLayout: self compositeChildrenLayout ].
	self nodeStyle
		ifNotNil: [ node
				addStyle:
					(self nodeStyle isBlock
						ifTrue: [ self nodeStyle cull: node entity cull: node ]
						ifFalse: self nodeStyle) ].
	(node isComposite and: self childrenSortingStrategy notNil)
		ifTrue: [ node childrenGroup sortingStrategy: self childrenSortingStrategy ]
]

{ #category : #initialization }
TLNodeCreationStrategy >> initialize [
	super initialize.
	self childrenStrategy: nil.
	self compositeProperty: nil
]

{ #category : #accessing }
TLNodeCreationStrategy >> nodeStyle [
	^ nodeStyle
]

{ #category : #accessing }
TLNodeCreationStrategy >> nodeStyle: anObject [
	nodeStyle := anObject
]

{ #category : #'node-creation' }
TLNodeCreationStrategy >> requireCompositeCreation [
	^ self childrenStrategy notNil
]
