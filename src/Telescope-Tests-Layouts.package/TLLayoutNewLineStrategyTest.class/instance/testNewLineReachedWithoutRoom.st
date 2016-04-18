tests
testNewLineReachedWithoutRoom
	| node |
	strategy := TLLayoutNewLineReachedDimensionStrategy dimension: 5.
	node := context mock: 'Node'.
	node can
		receive: #dimension;
		answers: 10 @ 10.
	self assert: (strategy shouldCreateNewLineFrom: 0 @ 0 currentNodeNumberOnLine: 1 forDimension: node dimension)