tests
testMoveChildNodeFromOneParentToAnother
	| childNode anotherNode |
	childNode := node addChildNodeFromEntity: #child.
	anotherNode := TLCompositeNode new.
	node childrenNodes first parent: anotherNode.
	self assert: node childrenNodes isEmpty.
	self assert: anotherNode childrenNodes size equals: 1.
	self assert: childNode parent equals: anotherNode