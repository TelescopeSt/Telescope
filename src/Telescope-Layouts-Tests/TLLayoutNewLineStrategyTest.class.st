Class {
	#name : #TLLayoutNewLineStrategyTest,
	#superclass : #TestCase,
	#instVars : [
		'strategy'
	],
	#category : #'Telescope-Layouts-Tests'
}

{ #category : #tests }
TLLayoutNewLineStrategyTest >> testNewLineRatioFixingDimension [
	| nodes layout |
	strategy := TLLayoutNewLineRatioDispositionStrategy ratio: 4 / 3.
	layout := Mock named: 'layout'.
	layout stub horizontalGap willReturn: 5.
	layout stub verticalGap willReturn: 5.
	nodes := (1 to: 12)
		collect: [ :i | 
			| node |
			node := Mock named: 'Node' , i asString.
			node stub dimension willReturn: 10 @ 10.
			node stub isNode willReturn: true.
			node stub children willReturn: {}.
			node ].
	(layout stub obtainsNodeDimension: Any) willReturn: 10 @ 10.
	strategy prepareFor: nodes onLayout: layout.
	self assert: strategy maxDimension equals: 55	"4 nodes of 10 + 3 gap of 5"
]

{ #category : #tests }
TLLayoutNewLineStrategyTest >> testNewLineReachedWithRoom [
	| node |
	strategy := TLLayoutNewLineReachedDimensionStrategy dimension: 100.
	node := Mock named: 'Node'.
	node stub dimension willReturn: 10 @ 10.
	self deny: (strategy shouldCreateNewLineFrom: 0 @ 0 currentNodeNumberOnLine: 1 forDimension: node dimension)
]

{ #category : #tests }
TLLayoutNewLineStrategyTest >> testNewLineReachedWithoutRoom [
	| node |
	strategy := TLLayoutNewLineReachedDimensionStrategy dimension: 5.
	node := Mock named: 'Node'.
	node stub dimension willReturn: 10 @ 10.
	self assert: (strategy shouldCreateNewLineFrom: 0 @ 0 currentNodeNumberOnLine: 1 forDimension: node dimension)
]

{ #category : #tests }
TLLayoutNewLineStrategyTest >> testNewLineWithMaxNumberOfElementsNotReach [
	| node |
	strategy := TLLayoutNewLineMaxNumberElementsStrategy maxNumberOfElements: 3.
	node := Mock named: 'Node'.
	node stub dimension willReturn: 10 @ 10.
	self deny: (strategy shouldCreateNewLineFrom: 0 @ 0 currentNodeNumberOnLine: 1 forDimension: node dimension)
]

{ #category : #tests }
TLLayoutNewLineStrategyTest >> testNewLineWithMaxNumberOfElementsReached [
	| node |
	strategy := TLLayoutNewLineMaxNumberElementsStrategy maxNumberOfElements: 1.
	node := Mock named: 'Node'.
	node stub dimension willReturn: 10 @ 10.
	self deny: (strategy shouldCreateNewLineFrom: 0 @ 0 currentNodeNumberOnLine: 1 forDimension: node dimension).
	self assert: (strategy shouldCreateNewLineFrom: 0 @ 0 currentNodeNumberOnLine: 2 forDimension: node dimension)
]
