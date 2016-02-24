tests
testNodesInGroupInGroup
	| group child1 child2 |
	group := TLVirtualGroup new.
	
	child1 := TLVirtualNode new dimension: 5 @ 10.
	child1 parent: group.
	child1 position: 2@2.
	
	child2 := TLVirtualNode new dimension: 7 @ 14.
	child2 parent: group.
	child2 position: 25@40.
	
	group position: 12@12.
	
	self assert: child1 absolutePosition equals: 14@14.
	self assert: child2 absolutePosition equals: 37@52.
	
	
	self assert: group extent equals: 30@52