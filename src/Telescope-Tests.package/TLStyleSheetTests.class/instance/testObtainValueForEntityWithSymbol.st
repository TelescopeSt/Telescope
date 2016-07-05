tests
testObtainValueForEntityWithSymbol
	stylesheet color: #red.
	self assert: (stylesheet obtainValue: #color forEntity: Color) equals: Color red