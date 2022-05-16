"
A TLNodeCollection is a collection of drawable that provides in addition to the usual Collection API, all the telescope API about connecting...
"
Class {
	#name : #TLDrawableCollection,
	#superclass : #OrderedCollection,
	#traits : 'TTLConnectable - {#connectTo:. #connectIfNotTo:. #connectTo:entity:} + TTLDrawableCollection',
	#classTraits : 'TTLConnectable classTrait + TTLDrawableCollection classTrait',
	#instVars : [
		'sortingStrategy'
	],
	#category : #'Telescope-Core-Model'
}

{ #category : #interaction }
TLDrawableCollection >> addInteraction: anInteraction [ 
	self do: [ :each | each addInteraction: anInteraction ].
	^ anInteraction
]

{ #category : #style }
TLDrawableCollection >> addStyle: aStyle [
	self do: [ :aDrawable | aDrawable addStyle: aStyle ]
]

{ #category : #accessing }
TLDrawableCollection >> allConnections [
	^ self flatCollectAsSet: #allConnections
]

{ #category : #enumerating }
TLDrawableCollection >> allNodesDo: aBlock [
	^ self
		do: [ :aTLEntity | 
			aTLEntity isNode
				ifTrue: [ aBlock value: aTLEntity ]
				ifFalse: [ aTLEntity allNodesDo: aBlock ] ]
]

{ #category : #enumerating }
TLDrawableCollection >> allNodesRecursivelyDo: aBlock [
	^ self
		do: [ :aTLEntity | 
			aTLEntity isNode
				ifTrue: [ aBlock value: aTLEntity.
					aTLEntity isCompositeNode
						ifTrue: [ aTLEntity allChildrenNodesRecursivelyDo: aBlock ] ]
				ifFalse: [ aTLEntity allNodesRecursivelyDo: aBlock ] ]
]

{ #category : #converting }
TLDrawableCollection >> asTLDrawableCollection [
	^ self
]

{ #category : #requirements }
TLDrawableCollection >> collection [
	^ self
]

{ #category : #connection }
TLDrawableCollection >> connectToNode: aNode entity: aConnectionEntity [
	^ self
		collect:
			[ :aDrawable | aDrawable connectToNode: aNode entity: aConnectionEntity ]
]

{ #category : #enumerating }
TLDrawableCollection >> nodesCollect: aBlock [
	^ self
		select: #isNode thenCollect: aBlock
]

{ #category : #enumerating }
TLDrawableCollection >> nodesDo: aBlock [
	^ self
		select: #isNode thenDo: aBlock
]

{ #category : #removing }
TLDrawableCollection >> removeAllConnections [
	self allNodesRecursivelyDo: #removeAllConnections
]

{ #category : #style }
TLDrawableCollection >> removeStyle: aStyle [
	self do: [ :aDrawable | aDrawable removeStyle: aStyle ]
]

{ #category : #removing }
TLDrawableCollection >> removed [
	self do: #removed
]
