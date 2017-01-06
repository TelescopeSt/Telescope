tests
testObtainValueForEntityWithGradient
	stylesheet color: (Color red property: #yourself gradientAt: 1).
	self assert: (stylesheet obtainValue: #color forEntity: 1 inNode: #node) equals: Color red