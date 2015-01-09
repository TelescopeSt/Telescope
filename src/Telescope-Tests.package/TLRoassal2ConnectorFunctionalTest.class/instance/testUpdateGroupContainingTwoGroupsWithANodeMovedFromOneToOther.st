running
testUpdateGroupContainingTwoGroupsWithANodeMovedFromOneToOther
	| node superGroup superGroupMock group1Mock group2Mock nodeMock layoutMock shapeMock |
	superGroup := TLEntitiesGroup new.
	superGroup nodeBuilder: TLNodeBuilder new.
	layoutMock := protocol mock: 'layout'.
	nodeMock := protocol mock: 'nodeMock'.
	shapeMock := protocol mock: 'shapeMock'.
	(superGroup ) layout: layoutMock.
	(superGroup > #group1) layout: layoutMock.
	(superGroup > #group2) layout: layoutMock.
	node := superGroup > #group1 addNodeFromEntity: 42.
	"layout should be applied on supergroup"
	protocol describe exactly: 3 times: layoutMock recv: #on:.	
	"Test due to hack to remove interactions"
	"protocol describe once: nodeMock recv: #update."
	protocol describe once: nodeMock recv: #shape; => shapeMock.
	protocol describe once: nodeMock recv: #announcer; => nodeMock.
	protocol describe once: nodeMock recv: #subscriptions; => nodeMock.
	protocol describe once: nodeMock recv: #subscriptionsDo:; => nodeMock.
	protocol describe once: nodeMock recv: #model:.
	protocol describe once: nodeMock recv: #update.
	protocol describe once: shapeMock recv: #color:.
	protocol describe once: shapeMock recv: #borderColor:.
	protocol describe once: shapeMock recv: #borderWidth:.
	protocol describe once: shapeMock recv: #height:.
	protocol describe once: shapeMock recv: #width:.
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
	self assert: group2Mock equals: (OrderedCollection with: nodeMock )