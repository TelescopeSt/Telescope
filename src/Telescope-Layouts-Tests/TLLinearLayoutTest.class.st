Class {
	#name : #TLLinearLayoutTest,
	#superclass : #TestCase,
	#instVars : [
		'layout'
	],
	#category : #'Telescope-Layouts-Tests'
}

{ #category : #tests }
TLLinearLayoutTest >> testPlace5IdenticalNodes [
	| nodes |
	layout := TLLinearLayout gap: 5.
	nodes := (1 to: 5)
		collect: [ :i | 
			| node |
			node := Mock named: 'Node' , i asString.
			node stub dimension willReturn: 10 @ 10.
			node stub isNode willReturn: true.
			node stub children willReturn: {}.
			node stub occupyMaxSpace willReturn: false.
			node ].
	{(5 @ 5) . (20 @ 5) . (35 @ 5) . (50 @ 5) . (65 @ 5)} doWithIndex: [ :position :ind | ((nodes at: ind) stub position: Any) willReturn: position ].

	layout on: nodes.
	nodes do: [ :node | node should receive position: Any ]
]

{ #category : #tests }
TLLinearLayoutTest >> testPlaceNodesOverflowingNumberOfElements [
	| nodes |
	layout := TLLinearLayout gap: 5 perLine: 3.
	nodes := (1 to: 5)
		collect: [ :i | 
			| node |
			node := Mock named: 'Node' , i asString.
			node stub dimension willReturn: 10 @ 10.
			node stub isNode willReturn: true.
			node stub children willReturn: {}.
			node stub occupyMaxSpace willReturn: false.
			node ].
	{(5 @ 5) . (20 @ 5) . (35 @ 5) . (50 @ 5) . (65 @ 5)} doWithIndex: [ :position :ind | ((nodes at: ind) stub position: Any) willReturn: position ].

	layout on: nodes.
	nodes do: [ :node | node should receive position: Any ]
]

{ #category : #tests }
TLLinearLayoutTest >> testPlaceNodesOverflowingWidth [
	| nodes |
	layout := TLLinearLayout gap: 5 maximumDimension: 50.
	nodes := (1 to: 5)
		collect: [ :i | 
			| node |
			node := Mock named: 'Node' , i asString.
			node stub dimension willReturn: 10 @ 10.
			node stub isNode willReturn: true.
			node stub children willReturn: {}.
			node stub occupyMaxSpace willReturn: false.
			node ].
	{(5 @ 5) . (20 @ 5) . (35 @ 5) . (50 @ 5) . (65 @ 5)} doWithIndex: [ :position :ind | ((nodes at: ind) stub position: Any) willReturn: position ].

	layout on: nodes.
	nodes do: [ :node | node should receive position: Any ]
]

{ #category : #tests }
TLLinearLayoutTest >> testPlaceNodesWithMultipleDimensionsCentered [
	| nodes |
	layout := TLLinearLayout gap: 5.
	nodes := (1 to: 5)
		collect: [ :i | 
			| node |
			node := Mock named: 'Node' , i asString.
			node stub dimension willReturn: 10 @ (i * 4).
			node stub isNode willReturn: true.
			node stub children willReturn: {}.
			node stub occupyMaxSpace willReturn: false.
			node ].
	{(5 @ 5) . (20 @ 5) . (35 @ 5) . (50 @ 5) . (65 @ 5)} doWithIndex: [ :position :ind | ((nodes at: ind) stub position: Any) willReturn: position ].

	layout on: nodes.
	nodes do: [ :node | node should receive position: Any ]
]
