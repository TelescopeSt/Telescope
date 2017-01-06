tests
testObtainValueForEntityWithSymbol
	stylesheet color: #red.
	self assert: (stylesheet obtainValue: #color forEntity: Color inNode: #node) equals: Color red