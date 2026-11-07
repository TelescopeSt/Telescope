"
I index the nodes of a group (a TLEntitiesGroup, a visualization or a TLDrawableCollection) by their entity, to find the targets of many connections without going through all the nodes for each one: connecting n nodes was quadratic.
I answer #nodesForEntities: and #nodeForEntity: as the group does, with the same nodes in the same order, so I can be given as the context of #connectFollowingProperty:context: to the nodes.
- #nodesForEntities: finds the nodes inside of the composite nodes too, the children before their composite, in the order of the group.
- #nodeForEntity: finds the first node of the group itself, then the first one of its sub-groups, and not the children of the composite nodes.
I am built when the connections are made and read the group lazily: the group must not change while I am used.
"
Class {
	#name : 'TLNodesByEntity',
	#superclass : 'Object',
	#instVars : [
		'context',
		'nodesByEntity',
		'orderOfNodes',
		'firstNodeByEntity'
	],
	#category : 'Telescope-Core-Model',
	#package : 'Telescope-Core',
	#tag : 'Model'
}

{ #category : 'instance creation' }
TLNodesByEntity class >> on: aGroup [
	"An index of the nodes of the group, which is read the first time a node is looked for"

	^ self new setContext: aGroup
]

{ #category : 'converting' }
TLNodesByEntity >> asNodesByEntity [
	"I am already an index: the sub-groups of the group share me"

	^ self
]

{ #category : 'private' }
TLNodesByEntity >> firstNodeByEntity [

	firstNodeByEntity ifNil: [
			firstNodeByEntity := Dictionary new.
			self indexFirstNodesOf: context ].
	^ firstNodeByEntity
]

{ #category : 'private' }
TLNodesByEntity >> index: aNode [

	(orderOfNodes includesKey: aNode) ifTrue: [ ^ self ].
	orderOfNodes at: aNode put: orderOfNodes size + 1.
	(nodesByEntity at: aNode entity ifAbsentPut: [ OrderedCollection new ]) add: aNode
]

{ #category : 'private' }
TLNodesByEntity >> indexFirstNodesOf: aGroup [
	"In the order of TTLDrawableCollection>>#nodeForEntity:ifAbsent:: the nodes of the group, then the ones of its sub-groups"

	aGroup nodes do: [ :node | firstNodeByEntity at: node entity ifAbsentPut: [ node ] ].
	aGroup subGroups do: [ :subGroup | self indexFirstNodesOf: subGroup ]
]

{ #category : 'private' }
TLNodesByEntity >> indexNodesOf: aGroup [
	"In the order of TTLDrawableCollection>>#nodesForEntities:: the children of a composite node before the composite"

	aGroup do: [ :drawable |
			drawable isNode
				ifTrue: [
						drawable isCompositeNode ifTrue: [ self indexNodesOf: drawable childrenGroup ].
						self index: drawable ]
				ifFalse: [ self indexNodesOf: drawable ] ]
]

{ #category : 'accessing' }
TLNodesByEntity >> nodeForEntity: anEntity [
	"The node of the entity as TTLDrawableCollection>>#nodeForEntity: finds it. Signals NotFound when there is none"

	^ self firstNodeByEntity at: anEntity ifAbsent: [ NotFound signalFor: anEntity ]
]

{ #category : 'private' }
TLNodesByEntity >> nodesByEntity [

	nodesByEntity ifNil: [
			nodesByEntity := Dictionary new.
			orderOfNodes := IdentityDictionary new.
			self indexNodesOf: context ].
	^ nodesByEntity
]

{ #category : 'accessing' }
TLNodesByEntity >> nodesForEntities: aCollectionOfEntities [
	"The nodes of these entities, in the order of the group, each one once, as TTLDrawableCollection>>#nodesForEntities: answers them"

	| nodes |
	nodes := (aCollectionOfEntities asSet flatCollect: [ :entity | self nodesByEntity at: entity ifAbsent: [ #(  ) ] ]) asArray.
	nodes size > 1 ifTrue: [ nodes sort: [ :first :second | (orderOfNodes at: first) < (orderOfNodes at: second) ] ].
	^ TLDrawableCollection withAll: nodes
]

{ #category : 'initialization' }
TLNodesByEntity >> setContext: aGroup [

	context := aGroup
]
