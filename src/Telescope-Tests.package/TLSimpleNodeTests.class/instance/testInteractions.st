tests
testInteractions
	self assert: node interactions size equals: 0.
	node addInteraction: TLPopUpAction onMouseOver.
	self assert: node interactions size equals: 1.
	