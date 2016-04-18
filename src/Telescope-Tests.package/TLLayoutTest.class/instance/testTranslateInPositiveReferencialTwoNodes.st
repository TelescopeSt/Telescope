as yet unclassified
testTranslateInPositiveReferencialTwoNodes
	| node1 node2 |
	node1 := context mock: 'node1'.
	node1 should
		receive: #dimension;
		answers: 4 @ 4.
	node1 should
		receive: #position:;
		with: 2 @ 9.
	node2 := context mock: 'node2'.
	node2 should
		receive: #dimension;
		answers: 6 @ 4.
	node2 should
		receive: #position:;
		with: 4 @ 2.
	layout
		translateInPositiveReferencial:
			{(node1 -> (-5 @ -1)).
			(node2 -> (-3 @ -8))} asDictionary