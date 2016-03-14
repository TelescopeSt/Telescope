tests
testAddNodeFromEntity
	| entityMock node |
	entityMock := protocol mock: 'entity'.
	protocol describe once: parentMock recv: #requireUpdate.
	protocol describe once: parentMock recv: #requireLayoutApplication.
	node := tlGroup addNodeFromEntity: entityMock.
	self assert: node class equals: TLSimpleNode.
	self assert: tlGroup size equals: 1