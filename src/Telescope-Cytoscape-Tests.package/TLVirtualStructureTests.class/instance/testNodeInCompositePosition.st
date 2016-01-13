as yet unclassified
testNodeInCompositePosition
	| parent child |
	parent := TLVirtualNode new dimension: 50 @ 40.
	parent compositeMargin: 5@5.
	child := TLVirtualNode new dimension: 5 @ 10.
	child parent: parent.
	child position: 2@2.
	parent position: 12@12.
	self assert: child absolutePosition equals: 19@19.
	self assert: parent dimension equals: 15@20