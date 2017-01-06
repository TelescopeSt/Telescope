tests
testAddNodeFromEntity
	| entityMock node |
	entityMock := protocol mock: 'entity'.
	node := tlGroup addNodeFromEntity: entityMock.
	self assert: node class equals: TLSimpleNode.
	self assert: tlGroup size equals: 1