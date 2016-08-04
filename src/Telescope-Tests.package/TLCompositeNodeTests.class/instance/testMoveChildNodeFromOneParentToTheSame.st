tests
testMoveChildNodeFromOneParentToTheSame
	| childNode  |
	childNode := node addChildNodeFromEntity: #child.
	childNode parent: node.
	childNode parent: node.
	self assert: node childrenNodes size equals: 1.
	self assert: childNode parent equals: node