tests
testNodeWithDimension
	| node |
	node := TLVirtualNode new dimension: 6 @ 10.
	node position: 42 @ 47.
	self assert: node absolutePosition equals: 42 @ 47.
	self assert: node extent equals: 6 @ 10.
	self assert: node encompassingRectangle equals: (39 @ 42 corner: 45 @ 52)