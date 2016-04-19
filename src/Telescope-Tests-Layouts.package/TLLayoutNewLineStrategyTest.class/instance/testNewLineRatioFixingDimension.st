tests
testNewLineRatioFixingDimension
	| nodes layout |
	strategy := TLLayoutNewLineRatioDispositionStrategy ratio: 4 / 3.
	layout := context mock: 'layout'.
	layout can
		receive: #horizontalGap;
		answers: 5.
	layout can
		receive: #verticalGap;
		answers: 5.
	nodes := (1 to: 12)
		collect: [ :i | 
			| node |
			node := context mock: 'Node' , i asString.
			node can
				receive: #dimension;
				answers: 10 @ 10.
			node ].
	layout can
		receive: #obtainsNodeDimension:;
		answers: 10 @ 10.
	strategy prepareFor: nodes onLayout: layout.
	self assert: strategy maxDimension equals: 55 "4 nodes of 10 + 3 gap of 5"