as yet unclassified
testAddNodeFromEntity
	| entityMock nodeBuilderMock nodeMock |
	nodeBuilderMock := protocol mock: 'nodeBuilder'.
	nodeMock := protocol mock: 'node'.
	entityMock := protocol mock: 'entity'.
	protocol describe
		once: nodeBuilderMock recv: #buildNodeFromEntity:;
		with: entityMock;
		=> nodeMock.
	protocol describe
		once: nodeMock recv: #parent:;
		with: tlGroup.
	protocol describe once: parentMock recv: #requireUpdate.
		protocol describe once: parentMock recv: #requireLayoutApplication.
	tlGroup nodeBuilder: nodeBuilderMock.
	tlGroup addNodeFromEntity: entityMock