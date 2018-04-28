Class {
	#name : #TLLayoutNewLineStrategyTest,
	#superclass : #BabyMockTestCase,
	#instVars : [
		'strategy'
	],
	#category : #'Telescope-Layouts-Tests'
}

{ #category : #tests }
TLLayoutNewLineStrategyTest >> testNewLineRatioFixingDimension [
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
			node can
				receive: #isNode;
				answers: true.
			node can
				receive: #children;
				answers: {}.
			node ].
	layout can
		receive: #obtainsNodeDimension:;
		answers: 10 @ 10.
	strategy prepareFor: nodes onLayout: layout.
	self assert: strategy maxDimension equals: 55	"4 nodes of 10 + 3 gap of 5"
]

{ #category : #tests }
TLLayoutNewLineStrategyTest >> testNewLineReachedWithRoom [
	| node |
	strategy := TLLayoutNewLineReachedDimensionStrategy dimension: 100.
	node := context mock: 'Node'.
	node can
		receive: #dimension;
		answers: 10 @ 10.
	self deny: (strategy shouldCreateNewLineFrom: 0 @ 0 currentNodeNumberOnLine: 1 forDimension: node dimension)
]

{ #category : #tests }
TLLayoutNewLineStrategyTest >> testNewLineReachedWithoutRoom [
	| node |
	strategy := TLLayoutNewLineReachedDimensionStrategy dimension: 5.
	node := context mock: 'Node'.
	node can
		receive: #dimension;
		answers: 10 @ 10.
	self assert: (strategy shouldCreateNewLineFrom: 0 @ 0 currentNodeNumberOnLine: 1 forDimension: node dimension)
]

{ #category : #tests }
TLLayoutNewLineStrategyTest >> testNewLineWithMaxNumberOfElementsNotReach [
	| node |
	strategy := TLLayoutNewLineMaxNumberElementsStrategy maxNumberOfElements: 3.
	node := context mock: 'Node'.
	node can
		receive: #dimension;
		answers: 10 @ 10.
	self deny: (strategy shouldCreateNewLineFrom: 0 @ 0 currentNodeNumberOnLine: 1 forDimension: node dimension)
]

{ #category : #tests }
TLLayoutNewLineStrategyTest >> testNewLineWithMaxNumberOfElementsReached [
	| node |
	strategy := TLLayoutNewLineMaxNumberElementsStrategy maxNumberOfElements: 1.
	node := context mock: 'Node'.
	node can
		receive: #dimension;
		answers: 10 @ 10.
	self deny: (strategy shouldCreateNewLineFrom: 0 @ 0 currentNodeNumberOnLine: 1 forDimension: node dimension).
	self assert: (strategy shouldCreateNewLineFrom: 0 @ 0 currentNodeNumberOnLine: 2 forDimension: node dimension)
]
