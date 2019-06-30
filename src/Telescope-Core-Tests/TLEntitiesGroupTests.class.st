Class {
	#name : #TLEntitiesGroupTests,
	#superclass : #BabyMock2TestCase,
	#instVars : [
		'tlGroup',
		'parentMock',
		'generatorMock'
	],
	#category : #'Telescope-Core-Tests-Model'
}

{ #category : #running }
TLEntitiesGroupTests >> setUp [
	super setUp.
	parentMock := protocol mock: 'parent'.
	generatorMock := protocol mock: 'generator'.
	protocol describe
		allow: parentMock recv: #generator;
		=> generatorMock.
	protocol describe
		allow: parentMock recv: #effectiveStyleSheet;
		=> TLStyleSheet default.
	protocol describe once: parentMock recv: #hierarchyHasChanged.
	protocol describe allow: parentMock recv: #requireUpdate.
	protocol describe allow: parentMock recv: #requireLayoutApplication.	
	
	tlGroup := TLEntitiesGroup new.
	tlGroup nodeCreationStrategy: TLNodeCreationStrategy default.
	protocol describe allow: parentMock recv: #addChild:.
	tlGroup parent: parentMock
]

{ #category : #tests }
TLEntitiesGroupTests >> testAddNodeFromEntity [
	| entityMock node |
	entityMock := protocol mock: 'entity'.
	node := tlGroup addNodeFromEntity: entityMock.
	self assert: node class equals: TLSimpleNode.
	self assert: tlGroup size equals: 1
]

{ #category : #tests }
TLEntitiesGroupTests >> testAllNodesDo [
	| node1 node2 node3 |
	node1 := protocol mock: 'node1'.
	node2 := protocol mock: 'node2'.
	node3 := protocol mock: 'node3'.
	protocol describe
		allow: node1 recv: #parent:;
		allow: node2 recv: #parent:;
		allow: node3 recv: #parent:;
		allow: node1 recv: #isNode;
		=> true;
		allow: node2 recv: #isNode;
		=> true;
		allow: node3 recv: #isNode;
		=> true;
		once: node1 recv: #testMessage;
		once: node2 recv: #testMessage;
		once: node3 recv: #testMessage.
	tlGroup > #subGroup addChild: node1.
	tlGroup addChild: node2.
	tlGroup > #subGroup > #subSubGroup addChild: node3.
	tlGroup allNodesDo: [ :aNode | aNode testMessage ]
]

{ #category : #tests }
TLEntitiesGroupTests >> testCreateASubGroup [
	self assert: tlGroup telescopeEntities isEmpty.
	self assert: (tlGroup > #subGroup) isEmpty.
	self assert: tlGroup telescopeEntities size equals: 1.
	self assert: tlGroup telescopeEntities first isGroup
]
