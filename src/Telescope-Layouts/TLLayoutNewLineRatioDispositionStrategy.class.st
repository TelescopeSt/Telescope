"
I am a strategy that will try to put elements in a rectangle with dimension as close as the desired ratio as possible. My behaviour is to define my max dimension before starting to place lines of nodes
"
Class {
	#name : #TLLayoutNewLineRatioDispositionStrategy,
	#superclass : #TLLayoutNewLineReachedDimensionStrategy,
	#instVars : [
		'ratio'
	],
	#category : #'Telescope-Layouts-Core'
}

{ #category : #accessing }
TLLayoutNewLineRatioDispositionStrategy class >> ratio: aRatio [
	^ self new ratio: aRatio
]

{ #category : #'as yet unclassified' }
TLLayoutNewLineRatioDispositionStrategy >> obtainRatioBySimulatingLayout: aLayout on: aGroup [
	| simulator |
	simulator := TLLinearLayoutSimulator new
		horizontalGap: aLayout horizontalGap;
		verticalGap: aLayout verticalGap;
		newLineStrategy: self;
		yourself.
	simulator executeOn: aGroup.
	^ simulator ratio
]

{ #category : #'as yet unclassified' }
TLLayoutNewLineRatioDispositionStrategy >> prepareFor: aGroup onLayout: aLayout [
	| dimensions numberOfNodes minRatio maxRatio simulatedRatio |
	aGroup ifEmpty: [ ^ self ].
	dimensions := aGroup collect: [ :aNode | aLayout obtainsNodeDimension: aNode ].
	numberOfNodes := ((dimensions size * ratio) sqrt rounded max: 1) min: dimensions size.
	[ minRatio isNil or: [ maxRatio isNil ] ]
		whileTrue: [ 
			self
				maxDimension:
					((1 to: numberOfNodes) sum: [ :i | (dimensions at: i) x ]) + ((numberOfNodes - 1) * aLayout horizontalGap).
			simulatedRatio := self obtainRatioBySimulatingLayout: aLayout on: aGroup.
			simulatedRatio > self ratio
				ifTrue: [ 
					maxRatio := simulatedRatio -> self maxDimension.
					(numberOfNodes := numberOfNodes - 1) = 0
						ifTrue: [ minRatio := maxRatio ] ]
				ifFalse: [ 
					minRatio := simulatedRatio -> self maxDimension.
					(numberOfNodes := numberOfNodes + 1) > aGroup size
						ifTrue: [ maxRatio := simulatedRatio -> self maxDimension ] ] ].
	self
		maxDimension:
			((minRatio key - ratio) abs < (maxRatio key - ratio) abs
				ifTrue: [ minRatio value ]
				ifFalse: [ maxRatio value ])
]

{ #category : #accessing }
TLLayoutNewLineRatioDispositionStrategy >> ratio [
	^ ratio
]

{ #category : #accessing }
TLLayoutNewLineRatioDispositionStrategy >> ratio: anObject [
	ratio := anObject
]
