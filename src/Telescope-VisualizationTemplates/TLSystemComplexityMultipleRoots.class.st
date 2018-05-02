"
A visualization to check inheritances in a collection of elements. Based on Moose visualization and extended from TLSystemComplexity
"
Class {
	#name : #TLSystemComplexityMultipleRoots,
	#superclass : #TLVisualization,
	#instVars : [
		'roots',
		'property',
		'scopeBlock',
		'widthBlock',
		'heightBlock',
		'backgroundColorBlock'
	],
	#category : #'Telescope-VisualizationTemplates'
}

{ #category : #accessing }
TLSystemComplexityMultipleRoots >> backgroundColorBlock [
	^ backgroundColorBlock
]

{ #category : #accessing }
TLSystemComplexityMultipleRoots >> backgroundColorBlock: anObject [
	backgroundColorBlock := anObject
]

{ #category : #building }
TLSystemComplexityMultipleRoots >> buildVisualization [
	self styleSheet
		width: self widthBlock;
		height: self heightBlock;
		backgroundColor: ((MDLColor white property: self backgroundColorBlock gradientAt: 0) to: MDLColor black at: (self roots collect: [ :e | self backgroundColorBlock value: e ]) max);
		borderColor: Color black.
	self > #default addNodesFromEntities: self roots.
	self > #default connectFollowingProperty: self property.
	self > #default layout: (TLTreeLayout angle: 180)
]

{ #category : #accessing }
TLSystemComplexityMultipleRoots >> defaultTitle [
	^ 'System Complexity'
]

{ #category : #accessing }
TLSystemComplexityMultipleRoots >> heightBlock [
	^ heightBlock
]

{ #category : #accessing }
TLSystemComplexityMultipleRoots >> heightBlock: anObject [
	heightBlock := anObject
]

{ #category : #accessing }
TLSystemComplexityMultipleRoots >> property [
	^ property
]

{ #category : #accessing }
TLSystemComplexityMultipleRoots >> property: anObject [
	property := anObject
]

{ #category : #accessing }
TLSystemComplexityMultipleRoots >> roots [
	^ roots
]

{ #category : #accessing }
TLSystemComplexityMultipleRoots >> roots: anObject [
	roots := anObject
]

{ #category : #accessing }
TLSystemComplexityMultipleRoots >> scopeBlock: anObject [
	scopeBlock := anObject
]

{ #category : #accessing }
TLSystemComplexityMultipleRoots >> widthBlock [
	^ widthBlock
]

{ #category : #accessing }
TLSystemComplexityMultipleRoots >> widthBlock: anObject [
	widthBlock := anObject
]
