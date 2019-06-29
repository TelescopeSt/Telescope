"
This visualization shows entities and their dependencies and identifies and handles cyclic dependencies.

Properties to set:
- #entities: list of entities to show
- #property: block to compute the dependencies of each entity
- #WidthBlock: / #heightBlock: block to compute the width/height of each entity displayed
"
Class {
	#name : #TLCycleDependencies,
	#superclass : #TLVisualization,
	#instVars : [
		'entities',
		'property',
		'widthBlock',
		'heightBlock'
	],
	#category : #'Telescope-VisualizationTemplates'
}

{ #category : #building }
TLCycleDependencies >> buildVisualization [

	| cycleCalculator |
	cycleCalculator := MalTarjan new.
	cycleCalculator nodes: self entities.
	cycleCalculator edges: self entities 
		from: #yourself
		toAll: self property.
	cycleCalculator run.

	( self > #packages ) styleSheet
		width: self widthBlock;
		height: self heightBlock;
		backgroundColor: [ :namespace | 
			(cycleCalculator findNode: namespace) isInCycle
				ifTrue: [ Color red ]
				ifFalse: [ Color white ] ].
			
	(self styleSheet > #connection) backgroundColor: Color veryLightGray.

	self > #packages
		addNodesFromEntities: self entities;
		connectFollowingProperty: self property;
		addInteraction: TLPopUpAction onMouseOver;
		layout: TLTreeLayout

]

{ #category : #accessing }
TLCycleDependencies >> defaultTitle [
	^ 'Cycle Dependencies'
]

{ #category : #accessing }
TLCycleDependencies >> entities [
	^ entities
]

{ #category : #accessing }
TLCycleDependencies >> entities: anObject [
	entities := anObject
]

{ #category : #accessing }
TLCycleDependencies >> heightBlock [
	^ heightBlock
]

{ #category : #accessing }
TLCycleDependencies >> heightBlock: anObject [
	heightBlock := anObject
]

{ #category : #accessing }
TLCycleDependencies >> property [
	^ property
]

{ #category : #accessing }
TLCycleDependencies >> property: anObject [
	property := anObject
]

{ #category : #accessing }
TLCycleDependencies >> widthBlock [
	^ widthBlock
]

{ #category : #accessing }
TLCycleDependencies >> widthBlock: anObject [
	widthBlock := anObject
]
