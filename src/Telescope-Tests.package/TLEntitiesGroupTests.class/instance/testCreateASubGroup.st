tests
testCreateASubGroup
	self assert: tlGroup telescopeEntities isEmpty.
	self assert: (tlGroup > #subGroup) isEmpty.
	self assert: tlGroup telescopeEntities size equals: 1.
	self assert: tlGroup telescopeEntities first isGroup