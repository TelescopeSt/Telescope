"
I am a simple strategy that will answer that you need to create a new line if you have already a certain amount of nodes on your current line.
"
Class {
	#name : #TLLayoutNewLineMaxNumberElementsStrategy,
	#superclass : #TLLayoutNewLineStrategy,
	#instVars : [
		'maxNumberOfElements'
	],
	#category : #'Telescope-Layouts-Core'
}

{ #category : #'instance creation' }
TLLayoutNewLineMaxNumberElementsStrategy class >> maxNumberOfElements: anInteger [
	^ self new
		maxNumberOfElements: anInteger;
		yourself
]

{ #category : #accessing }
TLLayoutNewLineMaxNumberElementsStrategy >> maxNumberOfElements [
	^ maxNumberOfElements
]

{ #category : #accessing }
TLLayoutNewLineMaxNumberElementsStrategy >> maxNumberOfElements: anObject [
	maxNumberOfElements := anObject
]

{ #category : #strategy }
TLLayoutNewLineMaxNumberElementsStrategy >> shouldCreateNewLineFrom: currentPosition currentNodeNumberOnLine: anInteger forDimension: nodeDimension [
	^ self maxNumberOfElements < anInteger
]
