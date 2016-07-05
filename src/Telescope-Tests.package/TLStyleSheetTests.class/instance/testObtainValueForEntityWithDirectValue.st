tests
testObtainValueForEntityWithDirectValue
	stylesheet color: Color red.
	self assert: (stylesheet obtainValue: #color forEntity: 1) equals: Color red