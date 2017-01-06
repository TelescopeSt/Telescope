tests
testObtainNodes
	self
		assert: collection obtain nodes asArray
		equals:
			{simple.
			composite}