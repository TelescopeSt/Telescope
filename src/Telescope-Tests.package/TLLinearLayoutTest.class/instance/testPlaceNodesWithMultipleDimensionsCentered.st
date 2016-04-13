tests
testPlaceNodesWithMultipleDimensionsCentered
	| nodes |
	layout := TLLinearLayout gap: 5.
	nodes := (1 to: 5)
		collect: [ :i | 
			| mock |
			mock := Mock named: 'Node ' , i asString.
			mock stub dimension willReturn: 10 @ (i * 4).
			mock ].
	layout on: nodes.
	nodes first should got position: 5 @ 10.
	nodes second should got position: 20 @ 10.
	nodes third should got position: 35 @ 10.
	nodes fourth should got position: 50 @ 10.
	nodes fifth should got position: 65 @ 10