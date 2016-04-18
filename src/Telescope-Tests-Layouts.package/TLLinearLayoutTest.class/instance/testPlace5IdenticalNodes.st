tests
testPlace5IdenticalNodes
	| nodes |
	layout := TLLinearLayout gap: 5.
	nodes := (1 to: 5)
		collect: [ :i | 
			| mock |
			mock := context mock: 'Node ', i asString.
			mock can receive: #dimension; answers: 10@10.
			mock ].
	nodes first should
		receive: #position:;
		with: 5@5.
	nodes second should
		receive: #position:;
		with: 20@5.
	nodes third should
		receive: #position:;
		with: 35@5.
	nodes fourth should
		receive: #position:;
		with: 50@5.
	nodes fifth should
		receive: #position:;
		with: 65@5.
	layout on: nodes.
	