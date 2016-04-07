tests
testPlaceNodesOverflowingWidth
	| nodes |
	layout := TLLinearLayout gap: 5 maximumWidth: 50.
	nodes := (1 to: 5)
		collect: [ :i | 
			| mock |
			mock := Mock named: 'Node ', i asString.
			mock stub dimension willReturn: 10@10.
			mock ].
	layout on: nodes.
	nodes first should got position: 5@5.
	nodes second should got position: 20@5.
	nodes third should got position: 35@5.
	nodes fourth should got position: 5@20.
	nodes fifth should got position: 20@20.
	