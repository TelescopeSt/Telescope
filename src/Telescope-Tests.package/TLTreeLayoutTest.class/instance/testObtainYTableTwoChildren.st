as yet unclassified
testObtainYTableTwoChildren
	| root tree child1 child2 |
	layout levelGap: 5.
	child1 := context mock: 'child1'.
	child1 can
		receive: #height;
		answers: 10.
	child2 := context mock: 'child2'.
	child2 can
		receive: #height;
		answers: 35.
	root := context mock: #root.
	root can
		receive: #height;
		answers: 20.
	tree := {(root
		->
			{(child1 -> Dictionary new).
			(child2 -> Dictionary new)} asDictionary)} asDictionary.
	self
		assert: (layout obtainYtableForTree: tree)
		equals:
			{0.
			25.
			65} asOrderedCollection