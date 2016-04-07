tests
testNewLineReachedWithoutRoom
	| node |
	strategy := TLLayoutNewLineReachedDimensionStrategy dimension: 5.
	node := Mock new.
	node stub dimension willReturn: 10 @ 10.
	self assert: (strategy shouldCreateNewLineFrom: 0 @ 0 currentNodeNumberOnLine: 1 forDimension: node dimension)