Class {
	#name : #TLLayoutTest,
	#superclass : #TestCase,
	#instVars : [
		'layout'
	],
	#category : #'Telescope-Layouts-Tests'
}

{ #category : #running }
TLLayoutTest >> setUp [
	super setUp.
	layout := TLLayout new
]

{ #category : #tests }
TLLayoutTest >> testRotatePoint [
	"The `00000000000001` are due to float calculation"

	layout angle: 90.
	self assert: (layout rotatePoint: 5 @ 5) equals: -5.0 @ 5.000000000000001.
	layout angle: 180.
	self assert: (layout rotatePoint: 5 @ 5) equals: -5.000000000000001 @ -5.0.
	layout angle: 270.
	self assert: (layout rotatePoint: 5 @ 5) equals: 5.0 @ -5.000000000000001
]

{ #category : #tests }
TLLayoutTest >> testRotateResult [
	"The `00000000000001` are due to float calculation"
	layout angle: 90.
	self assertCollection: (layout rotateResult: {(5 @ 5)}) hasSameElements: {(-5.0 @ 5.000000000000001)}.
	layout angle: 180.
	self assertCollection: (layout rotateResult: {(5 @ 5)}) hasSameElements: {(-5.000000000000001 @ -5.0)}.
	layout angle: 270.
	self assertCollection: (layout rotateResult: {(5 @ 5)}) hasSameElements: {(5.0 @ -5.000000000000001)}.
]

{ #category : #tests }
TLLayoutTest >> testTranslateInPositiveReferencialOneNode [
	| node |
	node := Mock named: 'node'.
	node stub dimension willReturn: 8 @ 6.
	node stub isNode willReturn: true.
	node stub children willReturn: {}.
	(node stub position: Any) willReturn: 4 @ 3.

	self shouldnt: [ layout translateInPositiveReferencial: {(node -> (-6 @ -7))} asDictionary ] raise: Error.

	node should receive dimension.
	node should receive isNode.
	node should receive children.
	node should receive position: Any
]

{ #category : #tests }
TLLayoutTest >> testTranslateInPositiveReferencialTwoNodes [
	| node1 node2 |
	node1 := Mock named: 'node1'.
	node1 stub dimension willReturn: 4 @ 4.
	node1 stub isNode willReturn: true.
	node1 stub children willReturn: {}.
	(node1 stub position: Any) willReturn: 2 @ 9.
	node2 := Mock named: 'node2'.
	node2 stub dimension willReturn: 6 @ 4.
	node2 stub isNode willReturn: true.
	node2 stub children willReturn: {}.
	(node2 stub position: Any) willReturn: 4 @ 2.
	self shouldnt: [ layout translateInPositiveReferencial: (Dictionary with: node1 -> (-5 @ -1) with: node2 -> (-3 @ -8)) ] raise: Error.

	{node1 . node2}
		do: [ :node | 
			node should receive dimension.
			node should receive isNode.
			node should receive children.
			node should receive position: Any ]
]
