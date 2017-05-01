tests
testObtainYTable
	| node root tree |
	layout levelGap: 5.
	node := context mock: 'child'.
	node can
		receive: #dimension;
		answers: 5 @ 10.
	node should
		receive: #isNode;
		answers: true.
	node can
		receive: #children;
		answers: {}.
	root := context mock: #root.
	root can
		receive: #dimension;
		answers: 10 @ 20.
	root should
		receive: #isNode;
		answers: true.
	root can
		receive: #children;
		answers: {}.
	tree := {(root -> {(node -> Dictionary new)} asDictionary)} asDictionary.
	self assert: (layout obtainYtableForTree: tree) equals: {0 . 25 . 40} asOrderedCollection