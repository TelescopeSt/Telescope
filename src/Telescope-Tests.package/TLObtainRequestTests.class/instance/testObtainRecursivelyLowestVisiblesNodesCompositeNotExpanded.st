tests
testObtainRecursivelyLowestVisiblesNodesCompositeNotExpanded
	composite expanded: false.
	self
		assert: collection obtain recursively lowestVisibles nodes asArray
		equals:
			{simple.
			composite.
			groupSimpleNode}