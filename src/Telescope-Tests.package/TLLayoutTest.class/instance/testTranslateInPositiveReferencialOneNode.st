as yet unclassified
testTranslateInPositiveReferencialOneNode
	| node |
	node := context mock: 'node'.
	node should
		receive: #dimension;
		answers: 8 @ 6.
	node should
		receive: #position:;
		with: 4 @ 3.
	layout translateInPositiveReferencial: {(node -> (-6 @ -7))} asDictionary