Class {
	#name : #TLLayoutTest,
	#superclass : #BabyMockTestCase,
	#instVars : [
		'layout'
	],
	#category : 'Telescope-Tests-Layouts'
}

{ #category : #running }
TLLayoutTest >> setUp [
	layout := TLLayout new
]

{ #category : #tests }
TLLayoutTest >> testTranslateInPositiveReferencialOneNode [
	| node |
	node := context mock: 'node'.
	node should
		receive: #dimension;
		answers: 8 @ 6.
	node should
		receive: #isNode;
		answers: true.
	node should
		receive: #children;
		answers: {}.
	node should
		receive: #position:;
		with: 4 @ 3.
	layout translateInPositiveReferencial: {(node -> (-6 @ -7))} asDictionary
]

{ #category : #tests }
TLLayoutTest >> testTranslateInPositiveReferencialTwoNodes [
	| node1 node2 |
	node1 := context mock: 'node1'.
	node1 should
		receive: #dimension;
		answers: 4 @ 4.
	node1 should
		receive: #isNode;
		answers: true.
	node1 should
		receive: #children;
		answers: {}.
	node1 should
		receive: #position:;
		with: 2 @ 9.
	node2 := context mock: 'node2'.
	node2 should
		receive: #dimension;
		answers: 6 @ 4.
	node2 should
		receive: #isNode;
		answers: true.
	node2 should
		receive: #children;
		answers: {}.
	node2 should
		receive: #position:;
		with: 4 @ 2.
	layout
		translateInPositiveReferencial:
			{(node1 -> (-5 @ -1)).
			(node2 -> (-3 @ -8))} asDictionary
]

{ #category : #tests }
TLLayoutTest >> testWithAngle [
	layout angle: 90.	
	"This is due to float calculation"
	self assert: (layout rotateResult: {5 @ 5}) first equals: 5.000000000000001 @ -5.0
]

{ #category : #tests }
TLLayoutTest >> testWithAngle2 [
	layout angle: 180.
	"This is due to float calculation"
	self assert: (layout rotateResult: {5 @ 5}) first equals:  -5.0 @ -5.000000000000001
]

{ #category : #tests }
TLLayoutTest >> testWithAngle3 [
	layout angle: 90.
	"This is due to float calculation"
	self assert: (layout rotateResult: {5 @ 5}) first equals:  -4.0 @ 4.000000000000001
]
