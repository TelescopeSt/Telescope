tests
testPlace5IdenticalNodes
	| nodes |
	layout := TLLinearLayout gap: 5.
	nodes := (1 to: 5)
		collect: [ :i | 
			| mock |
			mock := Mock named: 'Node ', i asString.
			mock stub width willReturn: 10.
			mock stub height willReturn: 10.
			mock stub dimension willReturn: 10@10.
			mock ].
	layout on: nodes.
	nodes first should got position: 5@5.
	nodes second should got position: 20@5.
	nodes third should got position: 35@5.
	nodes fourth should got position: 50@5.
	nodes fifth should got position: 65@5.
	