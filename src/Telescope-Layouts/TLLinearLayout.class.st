"
I am a layout able to display nodes on one or multiple lines.
I have a newLineStrategy to decide if i should create a new line
"
Class {
	#name : #TLLinearLayout,
	#superclass : #TLLayout,
	#instVars : [
		'horizontalGap',
		'verticalGap',
		'newLineStrategy'
	],
	#category : 'Telescope-Layouts'
}

{ #category : #'instance-creation' }
TLLinearLayout class >> gap: aNumber [
	^ self new
		gap: aNumber;
		yourself
]

{ #category : #'instance-creation' }
TLLinearLayout class >> gap: aGap maximumDimension: aDimension [
	^ (self gap: aGap)
		maximumDimension: aDimension;
		yourself
]

{ #category : #'instance-creation' }
TLLinearLayout class >> gap: aGap perLine: anInteger [
	^ (self gap: aGap)
		maxElementsPerLine: anInteger;
		yourself
]

{ #category : #'instance-creation' }
TLLinearLayout class >> gap: aGap ratio: aRatio [
	^ (self gap: aGap)
		ratio: aRatio;
		yourself
]

{ #category : #'instance-creation' }
TLLinearLayout class >> maximumDimension: aDimension [
	^ self new
		maximumDimension: aDimension;
		yourself
]

{ #category : #'instance-creation' }
TLLinearLayout class >> perLine: anInteger [
	^ self new
		maxElementsPerLine: anInteger;
		yourself
]

{ #category : #'instance-creation' }
TLLinearLayout class >> ratio: aRatio [
	^ self new
		ratio: aRatio;
		yourself
]

{ #category : #placing }
TLLinearLayout >> adjustPosition: currentPosition withHeight: nodeHeight forMaxHeight: maxHeight [
	^ currentPosition + (0 @ ((maxHeight - nodeHeight) / 2))
]

{ #category : #placing }
TLLinearLayout >> executeOn: aGroup [
	| nodesOnLine lineOfNodesWithPosition maxHeight currentPosition |
	currentPosition := 0 @ 0.
	maxHeight := 0.
	nodesOnLine := 1.
	lineOfNodesWithPosition := OrderedDictionary new.
	aGroup
		do: [ :aNode | 
			| nodeDimension |
			nodeDimension := self obtainsNodeDimension: aNode.
			(self newLineStrategy
				shouldCreateNewLineFrom: currentPosition
				currentNodeNumberOnLine: nodesOnLine
				forDimension: aNode dimension)
				ifTrue: [ 
					currentPosition := 0 @ (currentPosition y + maxHeight + self verticalGap).
					nodesOnLine := 1.
					self placeLineOfNodes: lineOfNodesWithPosition maxHeight: maxHeight.
					maxHeight := 0.
					lineOfNodesWithPosition removeAll ].
			maxHeight := maxHeight max: nodeDimension y.
			nodesOnLine := nodesOnLine + 1.
			lineOfNodesWithPosition at: aNode put: currentPosition + (nodeDimension / 2) -> nodeDimension y.
			currentPosition := currentPosition + ((self horizontalGap + nodeDimension x) @ 0) ].
	self placeLineOfNodes: lineOfNodesWithPosition maxHeight: maxHeight
]

{ #category : #accessing }
TLLinearLayout >> gap: aNumber [
	self verticalGap: aNumber.
	self horizontalGap: aNumber.
]

{ #category : #accessing }
TLLinearLayout >> horizontalGap [
	^ horizontalGap
]

{ #category : #accessing }
TLLinearLayout >> horizontalGap: aNumber [
	horizontalGap := aNumber
]

{ #category : #initialization }
TLLinearLayout >> initialize [
	super initialize.
	self gap: 5.
]

{ #category : #strategy }
TLLinearLayout >> maxElementsPerLine: aNumberOfElements [
	self newLineStrategy: (TLLayoutNewLineMaxNumberElementsStrategy maxNumberOfElements: aNumberOfElements)
]

{ #category : #strategy }
TLLinearLayout >> maximumDimension: aDimension [
	self newLineStrategy: (TLLayoutNewLineReachedDimensionStrategy dimension: aDimension)
]

{ #category : #accessing }
TLLinearLayout >> newLineStrategy [
	^ newLineStrategy ifNil: [ newLineStrategy := TLLayoutNewLineReachedDimensionStrategy dimension: Float infinity ]
]

{ #category : #accessing }
TLLinearLayout >> newLineStrategy: anObject [
	newLineStrategy := anObject
]

{ #category : #placing }
TLLinearLayout >> placeLineOfNodes: lineOfNodesWithPosition maxHeight: maxHeight [
	lineOfNodesWithPosition
		keysAndValuesDo: [ :aNode :aPositionAndSize |
			aNode occupyMaxSpace
				ifTrue: [ 
					self changeNode: aNode dimension: aNode width @ maxHeight ].
			self
				definePosition:
					(self adjustPosition: aPositionAndSize key withHeight: aPositionAndSize value forMaxHeight: maxHeight)
				forNode: aNode ]
]

{ #category : #placing }
TLLinearLayout >> prepareFor: aGroup [
	self newLineStrategy prepareFor: aGroup onLayout: self.
]

{ #category : #strategy }
TLLinearLayout >> ratio: aRatio [
	self newLineStrategy: (TLLayoutNewLineRatioDispositionStrategy ratio: aRatio)
]

{ #category : #accessing }
TLLinearLayout >> verticalGap [
	^ verticalGap
]

{ #category : #accessing }
TLLinearLayout >> verticalGap: aNumber [
	verticalGap := aNumber
]
