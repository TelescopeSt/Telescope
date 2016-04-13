as yet unclassified
testObtainYTable
	| node root tree |
	node := Mock named: 'child'.
	node stub height willReturn: 10.
	root := Mock named: #root.
	root stub height willReturn: 20.
	tree := {(root -> {(node -> Dictionary new)} asDictionary)} asDictionary.
	self
		assert: (layout obtainYtableForTree: tree)
		equals:
			{20.
			10}