"
I am a layout able to display nodes equidistant as a circle.
The arcGap is the number of pixel between two nodes
"
Class {
	#name : #TLCircularLayout,
	#superclass : #TLLayout,
	#instVars : [
		'arcGap'
	],
	#category : #'Telescope-Layouts-Core'
}

{ #category : #accessing }
TLCircularLayout class >> gap: aNumber [
	^ self new
		arcGap: aNumber;
		yourself
]

{ #category : #accessing }
TLCircularLayout >> arcGap [
	^ arcGap
]

{ #category : #accessing }
TLCircularLayout >> arcGap: anObject [
	arcGap := anObject
]

{ #category : #placing }
TLCircularLayout >> executeOn: aGroup [
	| angleByNode diagonalSum radius |
	angleByNode := Float twoPi / aGroup size.
	diagonalSum := aGroup sum: [ :aNode | aNode dimension dist: 0@0 ].
	radius := (self arcGap * aGroup size + diagonalSum) / Float twoPi.
	aGroup
		doWithIndex: [ :aNode :anIndex | 
			| nodeAngle |
			nodeAngle := anIndex * angleByNode.
			self definePosition: (nodeAngle cos * radius) @ (nodeAngle sin * radius) forNode: aNode ]
]

{ #category : #initialization }
TLCircularLayout >> initialize [
	super initialize.
	self arcGap: 5
]
