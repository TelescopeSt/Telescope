tests
testNewLineReachedWithRoom
	| node |
	strategy := TLLayoutNewLineReachedDimensionStrategy dimension: 100.
	node := context mock: 'Node'.
	node can
		receive: #dimension;
		answers: 10 @ 10.
	self deny: (strategy shouldCreateNewLineFrom: 0 @ 0 currentNodeNumberOnLine: 1 forDimension: node dimension)