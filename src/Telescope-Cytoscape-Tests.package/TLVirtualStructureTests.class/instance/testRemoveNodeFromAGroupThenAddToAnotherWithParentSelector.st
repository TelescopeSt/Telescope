tests
testRemoveNodeFromAGroupThenAddToAnotherWithParentSelector
	|groupSource groupTarget node|
	node:= TLVirtualNode new.
	groupSource := TLVirtualGroup new.
	groupTarget := TLVirtualGroup new.
	node parent: groupSource.
	self assert: node parent equals: groupSource.
	self assert: groupSource size equals: 1.
	self assert: groupSource first equals: node.
	 
	groupSource remove: node.
	node parent: groupTarget.
	self assert: node parent equals: groupTarget.
	self assert: groupSource size equals: 0.
	self assert: groupTarget size equals: 1.
	self assert: groupTarget first equals: node.
	