Class {
	#name : #TLRoassal2ConnectorFunctionalTest,
	#superclass : #BabyMock2TestCase,
	#instVars : [
		'connector',
		'view'
	],
	#category : 'Telescope-Roassal2-Tests'
}

{ #category : #running }
TLRoassal2ConnectorFunctionalTest >> setUp [
	view := protocol mock: 'view'.
	connector := TLRoassal2Connector new.
	connector view: view.
]

{ #category : #running }
TLRoassal2ConnectorFunctionalTest >> testAddNodeInSubGroupDefineUpdateRequired [
	| group |
	group := TLEntitiesGroup new.
	group styleSheet: TLStyleSheet default.
	group nodeCreationStrategy: TLNodeCreationStrategy default.
	group > #subGroup addNodeFromEntity: 10.
	self assert: (group > #subGroup) isUpdateRequired.
	self assert: group isUpdateRequired.
	self assert: (group > #subGroup) isLayoutApplicationRequired.
	self assert: (group) isLayoutApplicationRequired.
	
	 
]

{ #category : #running }
TLRoassal2ConnectorFunctionalTest >> testAddNodeInView [
	| node group |
	group := protocol mock: 'group'.
	protocol describe allow: group recv: #effectiveStyleSheet; => TLStyleSheet default.
	protocol describe allow: group recv: #isNode; => false.
	protocol describe allow: group recv: #allInteractions; => #().
	node := TLSimpleNode withEntity: 42.
	node parent: group.
	self assert: connector shapeByDrawable isEmpty.
	protocol describe once: view recv: #add:.
	node generateWith: connector.
	self assert: connector shapeByDrawable size equals: 1.
	^ node
]

{ #category : #running }
TLRoassal2ConnectorFunctionalTest >> testRemoveNodeInView [
	| node |
	node := self testAddNodeInView.
	protocol describe once: view recv: #removeElement:; with: (connector shapeByDrawable at: node).
	node removeWith: connector.
	self assert: connector shapeByDrawable isEmpty
]

{ #category : #running }
TLRoassal2ConnectorFunctionalTest >> testUpdateGroupContainingTwoGroupsWithANodeMovedFromOneToOther [
	| node superGroup superGroupMock group1Mock group2Mock nodeMock layoutMock rectangle |
	superGroup := TLEntitiesGroup new.
	superGroup nodeCreationStrategy: TLNodeCreationStrategy default.
	superGroup styleSheet: TLStyleSheet default.
	layoutMock := protocol mock: 'layout'.
	nodeMock := protocol mock: 'nodeMock'.
	rectangle := protocol mock: 'rectangleShape'.
	superGroup layout: layoutMock.
	superGroup > #group1 layout: layoutMock.
	superGroup > #group2 layout: layoutMock.
	node := superGroup > #group1 addNodeFromEntity: 42.	"layout should be applied on supergroup"
	protocol describe exactly: 3 times: layoutMock recv: #on:.	"Test due to hack to remove interactions"	"protocol describe once: nodeMock recv: #update."
	protocol describe
		once: nodeMock recv: #announcer;
		=> nodeMock.
	protocol describe
		once: nodeMock recv: #subscriptions;
		=> nodeMock.
	protocol describe
		once: nodeMock recv: #subscriptionsDo:;
		=> nodeMock.
	protocol describe
		once: rectangle recv: #borderColor:;
		once: rectangle recv: #borderWidth:;
		once: rectangle recv: #width:;
		once: rectangle recv: #color:;
		once: rectangle recv: #isComposite;
		=> false;
		once: rectangle recv: #height:.
	protocol describe
		once: nodeMock recv: #shape;
		=> rectangle.
	protocol describe once: nodeMock recv: #model:.
	protocol describe once: nodeMock recv: #update.
	group1Mock := OrderedCollection with: nodeMock.
	group2Mock := OrderedCollection new.
	superGroupMock := OrderedCollection with: group1Mock with: group2Mock.
	connector shapeByDrawable at: superGroup put: superGroupMock.
	connector shapeByDrawable at: superGroup > #group1 put: group1Mock.
	connector shapeByDrawable at: superGroup > #group2 put: group2Mock.
	connector shapeByDrawable at: node put: nodeMock.
	node moveToGroup: superGroup > #group2.
	connector updateGroup: superGroup.
	self assert: group1Mock isEmpty.
	self assert: group2Mock equals: (OrderedCollection with: nodeMock)
]

{ #category : #running }
TLRoassal2ConnectorFunctionalTest >> testUpdateGroupWithOneDrawableRequiringLayoutApplication [
	| group node mockGroup mockSubGroup mockElement groupLayout subGroupLayout rectangle |
	group := TLEntitiesGroup new.
	group nodeCreationStrategy: TLNodeCreationStrategy default.
	groupLayout := protocol mock: 'groupLayout'.
	group styleSheet: TLStyleSheet default.
	group layout: groupLayout.
	rectangle := protocol mock: 'rectangleShape'.
	node := group > #subGroup addNodeFromEntity: 10.
	subGroupLayout := protocol mock: 'subGroupLayout'.
	group > #subGroup layout: subGroupLayout.
	"Those mocks simulate roassal behavior"
	mockElement := protocol mock: 'mockElement'.
	mockSubGroup := OrderedCollection with: mockElement.
	mockGroup := OrderedCollection with: mockSubGroup.
	protocol describe
		once: rectangle recv: #borderColor:;
		once: rectangle recv: #borderWidth:;
		once: rectangle recv: #width:;
		once: rectangle recv: #color:;
		once: rectangle recv: #isComposite;
		=> false;
		once: rectangle recv: #height:.
	"protocol describe once: mockElement recv: #update."
	protocol describe once: mockElement recv: #model:.
	protocol describe once: mockElement recv: #announcer; => mockElement.
	protocol describe once: mockElement recv: #subscriptions; => mockElement.
	protocol describe once: mockElement recv: #subscriptionsDo:; => mockElement.
	protocol describe once: mockElement recv: #shape; => rectangle .
	protocol describe once: mockElement recv: #update.
	connector shapeByDrawable at: group put: mockGroup.
	connector shapeByDrawable at: group > #subGroup put: mockSubGroup.
	connector shapeByDrawable at: node put: mockElement.
	protocol describe once: subGroupLayout recv: #on:; with: mockSubGroup.
	protocol describe once: groupLayout recv: #on:; with: mockGroup.
	group updateWith: connector.
]
