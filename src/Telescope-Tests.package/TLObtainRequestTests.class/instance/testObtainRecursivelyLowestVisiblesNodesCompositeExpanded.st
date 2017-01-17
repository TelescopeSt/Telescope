tests
testObtainRecursivelyLowestVisiblesNodesCompositeExpanded
	composite expanded: true.
	self
		assert: collection obtain recursively lowestVisibles nodes asArray
		equals:
			{simple.
			compositeChildrenNode.
			groupSimpleNode}