tests
testTwoNodesInCompositePosition
	| parent child1 child2 |
	parent := TLVirtualNode new dimension: 50 @ 40.
	parent compositeMargin: 0@0.
	child1 := TLVirtualNode new dimension: 6 @ 10.
	child1 parent: parent.
	child1 position: 3@5.
	
	child2 := TLVirtualNode new dimension: 8 @ 16.
	child2 parent: parent.
	child2 position: 26@40.
	
	parent position: 15@24.
	
	self assert: child1 absolutePosition equals: 3@5.
	self assert: child2 absolutePosition equals: 26@40.
	self assert: parent dimension equals: 30@48