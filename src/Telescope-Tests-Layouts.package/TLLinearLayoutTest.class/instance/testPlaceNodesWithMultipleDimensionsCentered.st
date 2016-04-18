tests
testPlaceNodesWithMultipleDimensionsCentered
	| nodes |
	layout := TLLinearLayout gap: 5.
	nodes := (1 to: 5)
		collect: [ :i | 
			| mock |
			mock := context mock: 'Node ' , i asString.
			mock can
				receive: #dimension;
				answers: 10 @ (i * 4).
			mock ].
	nodes first should
		receive: #position:;
		with: 5 @ 10.
	nodes second should
		receive: #position:;
		with: 20 @ 10.
	nodes third should
		receive: #position:;
		with: 35 @ 10.
	nodes fourth should
		receive: #position:;
		with: 50 @ 10.
	nodes fifth should
		receive: #position:;
		with: 65 @ 10.
	layout on: nodes