tests
testObtainRecursivelySimpleNodes
	self
		assert: collection obtain recursively simpleNodes asArray
		equals:
			{simple.
			compositeChildrenNode.
			groupSimpleNode}