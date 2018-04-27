Class {
	#name : #TLLinearLayoutTest,
	#superclass : #BabyMockTestCase,
	#instVars : [
		'layout'
	],
	#category : 'Telescope-Tests-Layouts'
}

{ #category : #tests }
TLLinearLayoutTest >> testPlace5IdenticalNodes [
	| nodes |
	layout := TLLinearLayout gap: 5.
	nodes := (1 to: 5)
		collect: [ :i | 
			| mock |
			mock := context mock: 'Node ' , i asString.
			mock can
				receive: #dimension;
				answers: 10 @ 10.
			mock can
				receive: #isNode;
				answers: true.
			mock can
				receive: #children;
				answers: {}.
			mock can
				receive: #occupyMaxSpace;
				answers: false.
			mock ].
	nodes first should
		receive: #position:;
		with: 5 @ 5.
	nodes second should
		receive: #position:;
		with: 20 @ 5.
	nodes third should
		receive: #position:;
		with: 35 @ 5.
	nodes fourth should
		receive: #position:;
		with: 50 @ 5.
	nodes fifth should
		receive: #position:;
		with: 65 @ 5.
	layout on: nodes
]

{ #category : #tests }
TLLinearLayoutTest >> testPlaceNodesOverflowingNumberOfElements [
	| nodes |
	layout := TLLinearLayout gap: 5 perLine: 3.
	nodes := (1 to: 5)
		collect: [ :i | 
			| mock |
			mock := context mock: 'Node ' , i asString.
			mock can
				receive: #dimension;
				answers: 10 @ 10.
			mock can
				receive: #isNode;
				answers: true.
			mock can
				receive: #children;
				answers: {}.
			mock can
				receive: #occupyMaxSpace;
				answers: false.
			mock ].
	nodes first should
		receive: #position:;
		with: 5 @ 5.
	nodes second should
		receive: #position:;
		with: 20 @ 5.
	nodes third should
		receive: #position:;
		with: 35 @ 5.
	nodes fourth should
		receive: #position:;
		with: 5 @ 20.
	nodes fifth should
		receive: #position:;
		with: 20 @ 20.
	layout on: nodes
]

{ #category : #tests }
TLLinearLayoutTest >> testPlaceNodesOverflowingWidth [
	| nodes |
	layout := TLLinearLayout gap: 5 maximumDimension: 50.
	nodes := (1 to: 5)
		collect: [ :i | 
			| mock |
			mock := context mock: 'Node ' , i asString.
			mock can
				receive: #dimension;
				answers: 10 @ 10.
			mock can
				receive: #isNode;
				answers: true.
			mock can
				receive: #children;
				answers: {}.
			mock can
				receive: #occupyMaxSpace;
				answers: false.
			mock ].
	nodes first should
		receive: #position:;
		with: 5 @ 5.
	nodes second should
		receive: #position:;
		with: 20 @ 5.
	nodes third should
		receive: #position:;
		with: 35 @ 5.
	nodes fourth should
		receive: #position:;
		with: 5 @ 20.
	nodes fifth should
		receive: #position:;
		with: 20 @ 20.
	layout on: nodes
]

{ #category : #tests }
TLLinearLayoutTest >> testPlaceNodesWithMultipleDimensionsCentered [
	| nodes |
	layout := TLLinearLayout gap: 5.
	nodes := (1 to: 5)
		collect: [ :i | 
			| mock |
			mock := context mock: 'Node ' , i asString.
			mock can
				receive: #dimension;
				answers: 10 @ (i * 4).
			mock can
				receive: #isNode;
				answers: true.
			mock can
				receive: #children;
				answers: {}.
			mock can
				receive: #occupyMaxSpace;
				answers: false.
			mock ].
	nodes first should
		receive: #position:;
		with: 5 @ 10.
	nodes second should
		receive: #position:;
		with: 20 @ 10.
	nodes third should
		receive: #position:;
		with: 35 @ 10.
	nodes fourth should
		receive: #position:;
		with: 50 @ 10.
	nodes fifth should
		receive: #position:;
		with: 65 @ 10.
	layout on: nodes
]
