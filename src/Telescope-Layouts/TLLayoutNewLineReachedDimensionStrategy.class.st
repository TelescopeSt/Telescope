"
I am a strategy to answer if new line should be created depending on a maximum width
"
Class {
	#name : #TLLayoutNewLineReachedDimensionStrategy,
	#superclass : #TLLayoutNewLineStrategy,
	#instVars : [
		'maxDimension'
	],
	#category : #'Telescope-Layouts-Core'
}

{ #category : #'instance-creation' }
TLLayoutNewLineReachedDimensionStrategy class >> dimension: aDimension [
	^ self new
		maxDimension: aDimension;
		yourself
]

{ #category : #accessing }
TLLayoutNewLineReachedDimensionStrategy >> maxDimension [
	^ maxDimension
]

{ #category : #accessing }
TLLayoutNewLineReachedDimensionStrategy >> maxDimension: anObject [
	maxDimension := anObject
]

{ #category : #strategy }
TLLayoutNewLineReachedDimensionStrategy >> shouldCreateNewLineFrom: currentPosition currentNodeNumberOnLine: anInteger forDimension: nodeDimension [
	^ self maxDimension < (currentPosition x + nodeDimension x)
]
