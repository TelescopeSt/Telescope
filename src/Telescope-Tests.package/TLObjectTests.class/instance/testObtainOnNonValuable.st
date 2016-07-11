tests
testObtainOnNonValuable
	self assert: (tlObject obtain: (1 to: 5) on: tlObject) equals: (1 to: 5)