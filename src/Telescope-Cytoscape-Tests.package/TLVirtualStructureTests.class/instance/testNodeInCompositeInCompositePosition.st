tests
testNodeInCompositeInCompositePosition
	| parent child grandParent |
	grandParent := TLVirtualNode new dimension: 16 @ 12.
	grandParent compositeMargin: 10@17.
	grandParent position: 7@24.
	parent := TLVirtualNode new dimension: 50 @ 40.
	parent compositeMargin: 5@5.
	parent parent: grandParent.
	child := TLVirtualNode new dimension: 5 @ 10.
	child parent: parent.
	child position: 2@2.
	parent position: 12@12.
	self assert: child absolutePosition equals: 36@60.
	self assert: child dimension equals: 5@10.
	self assert: parent absolutePosition equals: 29@53.
	self assert: parent dimension equals: 15@20.
	self assert: grandParent absolutePosition equals: 7@24.
	self assert: grandParent dimension equals: 35@54.