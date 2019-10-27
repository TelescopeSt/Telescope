Class {
	#name : #TLLayoutNewLineStrategyTest,
	#superclass : #BabyMock2TestCase,
	#instVars : [
		'strategy'
	],
	#category : #'Telescope-Layouts-Tests'
}

{ #category : #tests }
TLLayoutNewLineStrategyTest >> testNewLineRatioFixingDimension [
	| nodes layout |
	strategy := TLLayoutNewLineRatioDispositionStrategy ratio: 4 / 3.
	layout := protocol mock: 'layout'.
	protocol describe
		allow: layout recv: #horizontalGap;
		=> 5;
		allow: layout recv: #verticalGap;
		=> 5.
	nodes := (1 to: 12)
		collect: [ :i | 
			| node |
			node := protocol mock: 'Node' , i asString.
			protocol describe
				allow: node recv: #dimension;
				=> (10 @ 10);
				allow: node recv: #isNode;
				=> true;
				allow: node recv: #children;
				=> {}.
			node ].
	protocol describe
		allow: layout recv: #obtainsNodeDimension:;
		=> (10 @ 10).
	strategy prepareFor: nodes onLayout: layout.
	self assert: strategy maxDimension equals: 55	"4 nodes of 10 + 3 gap of 5"
]

{ #category : #tests }
TLLayoutNewLineStrategyTest >> testNewLineReachedWithRoom [
	| node |
	strategy := TLLayoutNewLineReachedDimensionStrategy dimension: 100.
	node := protocol mock: 'Node'.
	protocol describe
		allow: node recv: #dimension;
		=> (10 @ 10).
	self deny: (strategy shouldCreateNewLineFrom: 0 @ 0 currentNodeNumberOnLine: 1 forDimension: node dimension)
]

{ #category : #tests }
TLLayoutNewLineStrategyTest >> testNewLineReachedWithoutRoom [
	| node |
	strategy := TLLayoutNewLineReachedDimensionStrategy dimension: 5.
	node := protocol mock: 'Node'.
	protocol describe
		allow: node recv: #dimension;
		=> (10 @ 10).
	self assert: (strategy shouldCreateNewLineFrom: 0 @ 0 currentNodeNumberOnLine: 1 forDimension: node dimension)
]

{ #category : #tests }
TLLayoutNewLineStrategyTest >> testNewLineWithMaxNumberOfElementsNotReach [
	| node |
	strategy := TLLayoutNewLineMaxNumberElementsStrategy maxNumberOfElements: 3.
	node := protocol mock: 'Node'.
	protocol describe
		allow: node recv: #dimension;
		=> (10 @ 10).
	self deny: (strategy shouldCreateNewLineFrom: 0 @ 0 currentNodeNumberOnLine: 1 forDimension: node dimension)
]

{ #category : #tests }
TLLayoutNewLineStrategyTest >> testNewLineWithMaxNumberOfElementsReached [
	| node |
	strategy := TLLayoutNewLineMaxNumberElementsStrategy maxNumberOfElements: 1.
	node := protocol mock: 'Node'.
	protocol describe
		allow: node recv: #dimension;
		=> (10 @ 10).
	self deny: (strategy shouldCreateNewLineFrom: 0 @ 0 currentNodeNumberOnLine: 1 forDimension: node dimension).
	self assert: (strategy shouldCreateNewLineFrom: 0 @ 0 currentNodeNumberOnLine: 2 forDimension: node dimension)
]
