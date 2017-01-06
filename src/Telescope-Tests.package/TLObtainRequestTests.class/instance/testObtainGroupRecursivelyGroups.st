tests
testObtainGroupRecursivelyGroups
	self
		assert: collection obtain groupRecursively groups asArray
		equals:
			{group.
			groupChildrenGroup}