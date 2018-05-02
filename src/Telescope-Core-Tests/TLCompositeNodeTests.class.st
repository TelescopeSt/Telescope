Class {
	#name : #TLCompositeNodeTests,
	#superclass : #BabyMock2TestCase,
	#instVars : [
		'node'
	],
	#category : #'Telescope-Core-Tests-Model'
}

{ #category : #running }
TLCompositeNodeTests >> setUp [
	node := TLCompositeNode new.
	node childrenNodeCreationStrategy: TLNodeCreationStrategy default.
	
]

{ #category : #tests }
TLCompositeNodeTests >> testChildrenCreationWithBlock [
	node entity: 42.
	node childrenProperty: [ :entity | 
			self assert: entity equals: 42.
			#(1 2 3) ].
	node createChildrenNodes.
	self assert: node childrenNodes size equals: 3.
	self assert: node childrenNodes first entity equals: 1.
	self assert: node childrenNodes second entity equals: 2.
	self assert: node childrenNodes third entity equals: 3
]

{ #category : #tests }
TLCompositeNodeTests >> testChildrenCreationWithCollectionOfEntities [
	node childrenProperty: #(1 2 3).
	node createChildrenNodes.
	self assert: node childrenNodes size equals: 3.
	self assert: node childrenNodes first entity equals: 1.
	self assert: node childrenNodes second entity equals: 2.
	self assert: node childrenNodes third entity equals: 3
]

{ #category : #tests }
TLCompositeNodeTests >> testChildrenCreationWithProperty [
	node entity: 30.
	node childrenProperty: #primeFactors.
	node createChildrenNodes.
	self assert: node childrenNodes size equals: 3.
	self assert: node childrenNodes first entity equals: 2.
	self assert: node childrenNodes second entity equals: 3.
	self assert: node childrenNodes third entity equals: 5
]

{ #category : #tests }
TLCompositeNodeTests >> testMoveChildNodeFromOneParentToAnother [
	| childNode anotherNode |
	childNode := node addChildNodeFromEntity: #child.
	anotherNode := TLCompositeNode new.
	node childrenNodes first parent: anotherNode.
	self assert: node childrenNodes isEmpty.
	self assert: anotherNode childrenNodes size equals: 1.
	self assert: childNode parent equals: anotherNode
]

{ #category : #tests }
TLCompositeNodeTests >> testMoveChildNodeFromOneParentToTheSame [
	| childNode  |
	childNode := node addChildNodeFromEntity: #child.
	childNode parent: node.
	childNode parent: node.
	self assert: node childrenNodes size equals: 1.
	self assert: childNode parent equals: node
]
