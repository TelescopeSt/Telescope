tests
testNewLineWithMaxNumberOfElementsNotReach
	| node |
	strategy := TLLayoutNewLineMaxNumberElementsStrategy maxNumberOfElements: 3.
	node := context mock: 'Node'.
	node can
		receive: #dimension;
		answers: 10 @ 10.
	self deny: (strategy shouldCreateNewLineFrom: 0 @ 0 currentNodeNumberOnLine: 1 forDimension: node dimension)