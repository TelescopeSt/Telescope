tests
testRemoveNodeFromAGroupThenAddToAnotherWithAdd
	|groupSource groupTarget node|
	node:= TLVirtualNode new.
	groupSource := TLVirtualGroup new.
	groupTarget := TLVirtualGroup new.
	groupSource add: node.
	self assert: node parent equals: groupSource.
	self assert: groupSource size equals: 1.
	self assert: groupSource first equals: node.
	 
	groupSource remove: node.
	groupTarget add: node.
	self assert: node parent equals: groupTarget.
	self assert: groupSource size equals: 0.
	self assert: groupTarget size equals: 1.
	self assert: groupTarget first equals: node.
	