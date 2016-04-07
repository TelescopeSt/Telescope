tests
testNewLineReachedWithRoom
	| node |
	strategy := TLLayoutNewLineReachedDimensionStrategy dimension: 100.
	node := Mock new.
	node stub dimension willReturn: 10 @ 10.
	self deny: (strategy shouldCreateNewLineFrom: 0 @ 0 currentNodeNumberOnLine: 1 forDimension: node dimension)