tests
testObtainRecursivelyLowestVisiblesNodesCompositeNotExpandedGroupInvisible
	composite expanded: false.
	group hide.
	self
		assert: collection obtain recursively lowestVisibles nodes asArray
		equals:
			{simple.
			composite}