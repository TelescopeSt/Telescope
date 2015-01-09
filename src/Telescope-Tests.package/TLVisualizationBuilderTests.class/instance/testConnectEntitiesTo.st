tests
testConnectEntitiesTo
	visualization > #testGroup addNodesFromEntities: (1 to: 5).
	visualization > #testGroup connectInsideGroupEntities: (1 to: 3) to: (4 to: 5).
	self assert: visualization allConnections size equals: 6