Class {
	#name : #TLCytoscapeConnectorTests,
	#superclass : #BabyMock2TestCase,
	#instVars : [
		'connector'
	],
	#category : 'Telescope-Cytoscape-Tests-Connector'
}

{ #category : #'as yet unclassified' }
TLCytoscapeConnectorTests >> setUp [
	connector := TLCytoscapeConnector new.
	self crLog: testSelector.
]

{ #category : #'as yet unclassified' }
TLCytoscapeConnectorTests >> testGroupUpdating [
	| group |
	group := TLEntitiesGroup new.
	group
		nodeCreationStrategy: TLNodeCreationStrategy default;
		styleSheet: TLStyleSheet default.
	group addNodesFromEntities: (1 to: 5).
	group generator: connector.
	group generate.
	self assert: (connector elementFromTLDrawable: group) class equals: TLVirtualGroup.
	self assert: (connector elementFromTLDrawable: group) size equals: 5.
	group removeEntity: 3.
	connector updateGroup: group.	
	self assert: (connector elementFromTLDrawable: group) size equals: 4.
	
]

{ #category : #'as yet unclassified' }
TLCytoscapeConnectorTests >> testGroupUpdatingAfterMoving [
	| groupA groupB node |
	groupA := TLEntitiesGroup new.
	groupA
		nodeCreationStrategy: TLNodeCreationStrategy default;
		styleSheet: TLStyleSheet default.
	groupB := TLEntitiesGroup new.
	groupB
		nodeCreationStrategy: TLNodeCreationStrategy default;
		styleSheet: TLStyleSheet default.
	node := groupA addNodeFromEntity: 1.
	groupA generator: connector.
	groupA generate.
	groupB generator: connector.
	groupB generate.
	self assert: (connector elementFromTLDrawable: node) parent equals: (connector elementFromTLDrawable: groupA).
	node moveToGroup: groupB.
	groupA update.
	groupB update.
	self assert: (connector elementFromTLDrawable: node) parent equals: (connector elementFromTLDrawable: groupB)
]

{ #category : #'as yet unclassified' }
TLCytoscapeConnectorTests >> testLayoutApplicationOnComposite [
	| group mockLayout |
	group := TLEntitiesGroup new.
	mockLayout := protocol mock: 'layout'.
	protocol describe once: mockLayout recv: #on:.
	group
		nodeCreationStrategy: (TLNodeCreationStrategy composite: [:i | i to: i + 5] withLayout: mockLayout);
		styleSheet: (TLStyleSheet default compositeExpandedByDefault: true).
	group addNodeFromEntity: 1.
	group generator: connector.
	group generate.
]

{ #category : #'as yet unclassified' }
TLCytoscapeConnectorTests >> testLayoutApplicationOnCompositeIntoComposite [
	| group mockLayout childrenMockLayout |
	group := TLEntitiesGroup new.
	mockLayout := protocol mock: 'layout'.
	childrenMockLayout := protocol mock: 'childrenLayout'.
	protocol describe once: mockLayout recv: #on:.
	protocol describe twice: childrenMockLayout recv: #on:.
	group
		nodeCreationStrategy: (TLNodeCreationStrategy composite: [ :i | i to: i + 1 ] withLayout: mockLayout);
		styleSheet: (TLStyleSheet default compositeExpandedByDefault: true).
	group nodeCreationStrategy
		childrenStrategy: (TLNodeCreationStrategy composite: [ :i | i to: i + 5 ] withLayout: childrenMockLayout).
	group addNodeFromEntity: 1.
	group generator: connector.
	group generate
]
