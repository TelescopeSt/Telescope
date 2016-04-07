tests
testNewLineReachedWithoutRoom
	| node |
	strategy := TLLayoutNewLineReachedWidthStrategy width: 5.
	node := Mock new.
	node stub dimension willReturn: 10 @ 10.
	self deny: (strategy shouldCreateNewLineFrom: 0 @ 0 currentNodeNumberOnLine: 1 for: node)