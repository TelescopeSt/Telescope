tests
testObtainCompositeRecursivelySimpleNodes
	self
		assert: collection obtain compositeRecursively simpleNodes asArray
		equals:
			{simple.
			compositeChildrenNode}