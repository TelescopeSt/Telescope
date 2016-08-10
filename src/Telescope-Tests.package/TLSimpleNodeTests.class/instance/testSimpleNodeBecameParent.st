tests
testSimpleNodeBecameParent
	| child |
	child := TLSimpleNode new.
	child parent: node.
	self assert: node isComposite.
	self assert: node childrenNodes size equals: 1.
	self assert: child parent equals: node.
	self assert: node isUpdateRequired 