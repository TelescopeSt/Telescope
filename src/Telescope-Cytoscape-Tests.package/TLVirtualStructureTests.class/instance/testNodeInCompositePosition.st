tests
testNodeInCompositePosition
	| parent child |
	parent := TLVirtualNode new dimension: 50 @ 40.
	parent compositeMargin: 5 @ 5.
	
	child := TLVirtualNode new dimension: 6 @ 10.
	child parent: parent.
	child position: 2 @ 2.
	parent position: 12 @ 12.
	
	self assert: parent position equals: 12 @ 12.
	self assert: parent absolutePosition equals: 12 @ 12.
	self assert: parent children absolutePosition equals: 12 @ 12.	"The children of the parent is a virtual group containing children of the composite."
	self assert: child absolutePosition equals: 14 @ 14.
	self assert: parent dimension equals: 16 @ 20