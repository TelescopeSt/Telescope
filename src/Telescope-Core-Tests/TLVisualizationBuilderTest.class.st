Class {
	#name : #TLVisualizationBuilderTest,
	#superclass : #BabyMock2TestCase,
	#instVars : [
		'mockGenerator',
		'visualization'
	],
	#category : #'Telescope-Core-Tests-Model'
}

{ #category : #running }
TLVisualizationBuilderTest >> setUp [
	super setUp.
	visualization := TLVisualization new.
	mockGenerator := protocol mock: 'generator'.
	visualization generator: mockGenerator.
]

{ #category : #tests }
TLVisualizationBuilderTest >> testAddEntitiesinGroup [
	visualization > #testGroup addNodesFromEntities: (1 to: 5).
	self assert: (visualization subGroupsDictionary includesKey: #testGroup).
	self assert: (visualization subGroupsDictionary at: #testGroup) size equals: 5.
]

{ #category : #tests }
TLVisualizationBuilderTest >> testConnectEntitiesTo [
	visualization > #testGroup addNodesFromEntities: (1 to: 5).
	visualization > #testGroup connectInsideGroupEntities: (1 to: 3) to: (4 to: 5).
	self assert: visualization allConnections size equals: 6
]

{ #category : #tests }
TLVisualizationBuilderTest >> testGroupIsCreated [
	| group |
	self assert: visualization subGroupsDictionary size equals: 0.
	group := visualization > #test.
	self assert: visualization subGroupsDictionary size equals: 1.
	self assert: group isEmpty.

]
