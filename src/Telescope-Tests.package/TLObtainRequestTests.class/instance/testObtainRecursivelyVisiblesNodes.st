tests
testObtainRecursivelyVisiblesNodes
	simple hide.
	composite expanded: false.
	self assert: collection obtain recursively visibles nodes asArray equals: {composite. groupSimpleNode }