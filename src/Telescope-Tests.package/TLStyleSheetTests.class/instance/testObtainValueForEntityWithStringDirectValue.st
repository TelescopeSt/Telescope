tests
testObtainValueForEntityWithStringDirectValue
	stylesheet nodeLabel: 'Foo'.
	self assert: (stylesheet obtainValue: #nodeLabel forEntity: 1) equals: 'Foo'