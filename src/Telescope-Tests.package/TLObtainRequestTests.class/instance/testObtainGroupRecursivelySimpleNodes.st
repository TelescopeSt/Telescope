tests
testObtainGroupRecursivelySimpleNodes
	self assert: collection obtain groupRecursively simpleNodes asArray equals: {simple . groupSimpleNode}