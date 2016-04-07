tests
testNewLineReachedWithRoom
	| node |
	strategy := TLLayoutNewLineReachedWidthStrategy width: 100.
	node := Mock new.
	node stub dimension willReturn: 10 @ 10.
	self deny: (strategy shouldCreateNewLineFrom: 0 @ 0 currentNodeNumberOnLine: 1 forDimension: node dimension)