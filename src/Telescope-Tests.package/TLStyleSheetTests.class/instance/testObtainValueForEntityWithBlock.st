tests
testObtainValueForEntityWithBlock
	stylesheet color: [:entity | Color red].
	self assert: (stylesheet obtainValue: #color forEntity: 1) equals: Color red