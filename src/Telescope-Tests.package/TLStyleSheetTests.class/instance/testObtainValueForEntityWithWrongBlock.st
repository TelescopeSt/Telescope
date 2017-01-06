tests
testObtainValueForEntityWithWrongBlock
	stylesheet color: [ :entity | entity foo ].
	self should: [ stylesheet obtainValue: #color forEntity: 1 inNode: #node ] raise: TLStyleSheetPropertyBadlyUsed