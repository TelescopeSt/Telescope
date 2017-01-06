tests
testObtainGroupsWithSelf
	self
		assert: group obtain recursively withSelf groups asArray
		equals:
			{group.
			groupChildrenGroup}