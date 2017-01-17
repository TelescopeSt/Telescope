tests
testObtainRecursivelyVisiblesNodesCompositeExpanded
	simple hide.
	composite expanded: true.
	self
		assert: collection obtain recursively visibles nodes asArray
		equals:
			{composite.
			compositeChildrenNode.
			groupSimpleNode}