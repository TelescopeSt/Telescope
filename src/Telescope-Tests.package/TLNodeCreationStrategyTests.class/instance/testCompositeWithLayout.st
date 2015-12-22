tests
testCompositeWithLayout
	| node |
	strategy := TLNodeCreationStrategy composite: [ :i | i + 1 to: i + 5 ] withLayout: #aFakeLayout.
	node := strategy createNodeFromEntity: 6.
	self assert: node isComposite.
	self assert: node childrenLayout equals: #aFakeLayout