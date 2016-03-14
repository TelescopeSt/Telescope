tests
testInteractions
	self assert: node interactions size equals: 0.
	node addInteraction: TLNodeBasicInteraction draggable.
	self assert: node interactions size equals: 1.
	