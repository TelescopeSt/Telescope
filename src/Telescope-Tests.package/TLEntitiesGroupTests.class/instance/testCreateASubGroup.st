tests
testCreateASubGroup
	self assert: tlGroup telescopeEntities isEmpty.
	protocol describe
		once: parentMock recv: #requireUpdate;
		once: parentMock recv: #requireLayoutApplication.
	self assert: (tlGroup > #subGroup) isEmpty.
	self assert: tlGroup telescopeEntities size equals: 1.
	self assert: tlGroup telescopeEntities first isGroup