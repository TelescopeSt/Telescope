"
I am a visualization representing a matrix. You need to provide a matric and corresponding xTitles and yTitles.
"
Class {
	#name : #TLMatrixVisualization,
	#superclass : #TLVisualization,
	#instVars : [
		'matrix',
		'xTitles',
		'yTitles'
	],
	#category : #'Telescope-VisualizationTemplates'
}

{ #category : #'instance creation' }
TLMatrixVisualization class >> newWithMatrix: matrix xTitles: xTitles yTitles: yTitles [
	^ self new
		matrix: matrix;
		xTitles: xTitles;
		yTitles: yTitles;
		yourself
]

{ #category : #building }
TLMatrixVisualization >> buildVisualization [
	self layout: TLLinearLayout topToBottom.
	((self > #title)
		layout: TLLinearLayout leftToRight;
		addNodeFromEntity: nil) addStyle: #blank.
	matrix
		doWithIndex: [ :e :index | 
			| group |
			self > #title addNodeFromEntity: (xTitles at: index).
			group := self > (#group , index asString).
			(group addNodeFromEntity: (yTitles at: index)) addStyle: #rowTitle.
			group layout:
					(TLLinearLayout leftToRight
						maxElementsPerLine: Float infinity;
						yourself).
			(group addNodesFromEntities: (matrix at: index)) addStyle: #cell ].
	self styleSheet
		nodeLabel: #asString;
		width: 30.
	(self styleSheet > #blank)
		shape: TLNoShape;
		noNodeLabel;
		backgroundColor: MDLColor white.
	self > #title backgroundColor: MDLColor red.
	self styleSheet > #rowTitle backgroundColor: MDLColor red.


]

{ #category : #accessing }
TLMatrixVisualization >> matrix [
	^ matrix
]

{ #category : #accessing }
TLMatrixVisualization >> matrix: anObject [
	matrix := anObject
]

{ #category : #accessing }
TLMatrixVisualization >> xTitles [
	^ xTitles
]

{ #category : #accessing }
TLMatrixVisualization >> xTitles: anObject [
	xTitles := anObject
]

{ #category : #accessing }
TLMatrixVisualization >> yTitles [
	^ yTitles
]

{ #category : #accessing }
TLMatrixVisualization >> yTitles: anObject [
	yTitles := anObject
]
