Class {
	#name : #TLEntitiesGroupTest,
	#superclass : #TestCase,
	#instVars : [
		'tlGroup',
		'parentMock'
	],
	#category : #'Telescope-Core-Tests-Model'
}

{ #category : #running }
TLEntitiesGroupTest >> setUp [
	| generatorMock|
	super setUp.
	parentMock := Mock named: 'parent'.
	generatorMock := Mock named: 'generator'.
	
	parentMock stub generator willReturn: generatorMock.
	parentMock stub effectiveStyleSheet willReturn: TLStyleSheet default.

	tlGroup := TLEntitiesGroup new.
	tlGroup nodeCreationStrategy: TLNodeCreationStrategy default.
	tlGroup parent: parentMock
]

{ #category : #running }
TLEntitiesGroupTest >> tearDown [
	parentMock should receive hierarchyHasChanged once.
	super tearDown
]

{ #category : #tests }
TLEntitiesGroupTest >> testAddNodeFromEntity [
	| entityMock node |
	entityMock := Mock named: 'entity'.
	node := tlGroup addNodeFromEntity: entityMock.
	self assert: node class equals: TLSimpleNode.
	self assert: tlGroup size equals: 1
]

{ #category : #tests }
TLEntitiesGroupTest >> testAllNodesDo [
	| node1 node2 node3 |
	node1 := Mock named: 'node1'.
	node2 := Mock named: 'node2'.
	node3 := Mock named: 'node3'.
	{node1 . node2 . node3} do: [ :node | node stub isNode willReturn: true ].
	tlGroup > #subGroup addChild: node1.
	tlGroup addChild: node2.
	tlGroup > #subGroup > #subSubGroup addChild: node3.
	tlGroup allNodesDo: [ :aNode | aNode testMessage ].
	{node1 . node2 . node3} do: [ :node | node should receive testMessage once ]
]

{ #category : #tests }
TLEntitiesGroupTest >> testCreateASubGroup [
	self assert: tlGroup telescopeEntities isEmpty.
	self assert: (tlGroup > #subGroup) isEmpty.
	self assert: tlGroup telescopeEntities size equals: 1.
	self assert: tlGroup telescopeEntities first isGroup
]
