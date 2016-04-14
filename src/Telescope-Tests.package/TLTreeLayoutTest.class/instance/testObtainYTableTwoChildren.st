as yet unclassified
testObtainYTableTwoChildren
	| root tree child1 child2 |
	layout levelGap: 5.
	child1 := context mock: 'child1'.
	child1 can
		receive: #dimension;
		answers: 5@10.
	child2 := context mock: 'child2'.
	child2 can
		receive: #dimension;
		answers: 47@35.
	root := context mock: #root.
	root can
		receive: #dimension;
		answers: 13@20.
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