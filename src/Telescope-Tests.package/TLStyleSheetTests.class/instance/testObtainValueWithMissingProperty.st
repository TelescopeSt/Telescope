tests
testObtainValueWithMissingProperty
	self should: [ stylesheet obtainValue: #color forEntity: 1 ] raise: TLStyleSheetMissingProperty