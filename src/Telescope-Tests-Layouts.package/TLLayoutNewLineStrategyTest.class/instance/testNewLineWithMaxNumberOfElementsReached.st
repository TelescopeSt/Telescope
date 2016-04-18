tests
testNewLineWithMaxNumberOfElementsReached
	| node |
	strategy := TLLayoutNewLineMaxNumberElementsStrategy maxNumberOfElements: 1.
	node := context mock: 'Node'.
	node can
		receive: #dimension;
		answers: 10 @ 10.
	self deny: (strategy shouldCreateNewLineFrom: 0 @ 0 currentNodeNumberOnLine: 1 forDimension: node dimension).
	self assert: (strategy shouldCreateNewLineFrom: 0 @ 0 currentNodeNumberOnLine: 2 forDimension: node dimension)