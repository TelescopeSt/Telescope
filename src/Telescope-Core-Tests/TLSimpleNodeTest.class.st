Class {
	#name : #TLSimpleNodeTest,
	#superclass : #TestCase,
	#instVars : [
		'node'
	],
	#category : #'Telescope-Core-Tests-Model'
}

{ #category : #running }
TLSimpleNodeTest >> setUp [
	super setUp.
	node := TLSimpleNode new
]

{ #category : #tests }
TLSimpleNodeTest >> testAddStyleRequireUpdate [
	self deny: node isUpdateRequired.
	node addStyle: #style.
	self assert: node isUpdateRequired
]

{ #category : #tests }
TLSimpleNodeTest >> testAdjacentNodes [
	| nodeFrom nodeTo |
	nodeFrom := TLSimpleNode new.
	nodeTo := TLSimpleNode new "shape: shape".
	nodeFrom connectTo: node.
	node connectTo: nodeTo.
	self assert: node adjacentNodes asSet equals: { nodeFrom . nodeTo } asSet
]

{ #category : #tests }
TLSimpleNodeTest >> testBecomeComposite [
	self deny: node isComposite.
	node becomeComposite.
	self assert: node isComposite
]

{ #category : #tests }
TLSimpleNodeTest >> testConnectionCreation [
	| anotherNode visualization |
	visualization := TLVisualization new.
	visualization addDrawable: node.
	anotherNode := TLSimpleNode new.
	visualization addDrawable: anotherNode.
	node connectTo: anotherNode.
	self assert: node outgoingConnections size equals: 1.
	self assert: anotherNode incomingConnections size equals: 1.
	self assert: node outgoingConnections first equals: anotherNode incomingConnections first
]

{ #category : #tests }
TLSimpleNodeTest >> testInteractions [
	self assert: node interactions size equals: 0.
	node addInteraction: TLPopUpAction onMouseOver.
	self assert: node interactions size equals: 1.
	
]

{ #category : #tests }
TLSimpleNodeTest >> testIsGroup [
	self deny: node isGroup
]

{ #category : #tests }
TLSimpleNodeTest >> testSimpleNodeBecameParent [
	| child |
	child := TLSimpleNode new.
	child parent: node.
	self assert: node isComposite.
	self assert: node childrenNodes size equals: 1.
	self assert: child parent equals: node.
	self assert: node isUpdateRequired 
]
