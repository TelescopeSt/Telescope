as yet unclassified
testObtainYTable
	| node root tree |
	layout levelGap: 5.
	node := context mock: 'child'.
	node can
		receive: #dimension;
		answers: 5@10.
	root := context mock: #root.
	root can
		receive: #dimension;
		answers: 10@20.
	tree := {(root -> {(node -> Dictionary new)} asDictionary)} asDictionary.
	self
		assert: (layout obtainYtableForTree: tree)
		equals:
			{0.
			25.
			40} asOrderedCollection