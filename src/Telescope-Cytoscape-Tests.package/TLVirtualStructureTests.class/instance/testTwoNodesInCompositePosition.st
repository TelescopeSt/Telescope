as yet unclassified
testTwoNodesInCompositePosition
	| parent child1 child2 |
	parent := TLVirtualNode new dimension: 50 @ 40.
	parent compositeMargin: 5@5.
	child1 := TLVirtualNode new dimension: 5 @ 10.
	child1 parent: parent.
	child1 position: 2@2.
	
	child2 := TLVirtualNode new dimension: 7 @ 14.
	child2 parent: parent.
	child2 position: 25@40.
	
	parent position: 12@12.
	
	self assert: child1 absolutePosition equals: 19@19.
	self assert: child2 absolutePosition equals: 42@57.
	
	
	self assert: parent dimension equals: 40@62