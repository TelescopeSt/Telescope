tests
testAddEntitiesinGroup
	visualization > #testGroup addNodesFromEntities: (1 to: 5).
	self assert: (visualization subGroupsDictionary includesKey: #testGroup).
	self assert: (visualization subGroupsDictionary at: #testGroup) size equals: 5.