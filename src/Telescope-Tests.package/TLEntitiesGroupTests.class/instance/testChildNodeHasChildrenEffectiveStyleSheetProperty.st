as yet unclassified
testChildNodeHasChildrenEffectiveStyleSheetProperty
	| entityMock compositeNode |
	entityMock := protocol mock: 'entity'.
	protocol describe allow: parentMock recv: #requireUpdate.
	protocol describe allow: parentMock recv: #requireLayoutApplication.
	tlGroup styleSheet childrenProperty: [ :entity | self assert: entity equals: entityMock. 1 to: 5 ].
	compositeNode := tlGroup addNodeFromEntity: entityMock.
	self assert: compositeNode isComposite.
	self assert: compositeNode childrenNodes size equals: 5.
	self assert: compositeNode childrenGroup nodeClass equals: TLSimpleNode