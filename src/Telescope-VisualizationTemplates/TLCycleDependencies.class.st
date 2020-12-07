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
		'heightBlock',
		'nodeColor'
	],
	#category : #'Telescope-VisualizationTemplates'
}

{ #category : #building }
TLCycleDependencies >> buildVisualization [

	| cycleCalculator |
	cycleCalculator := self cycleCalculator.

	(self > #packages) styleSheet backgroundColor: [ :namespace | 
		(cycleCalculator findNode: namespace) isInCycle
			ifTrue: [ self highlightColorForNode: namespace ]
			ifFalse: [ self defaultColorForNode: namespace ] ].

	self widthBlock ifNotNil: [ :blk | 
		(self > #packages) styleSheet width: blk ].
	self heightBlock ifNotNil: [ :blk | 
		(self > #packages) styleSheet height: blk ].

	self styleSheet > #connection backgroundColor: self edgeColor.

	(self > #packages)
		addNodesFromEntities: self entities;
		connectFollowingProperty: self property;
		addInteraction: self popup;
		layout: self nodesLayout
]

{ #category : #building }
TLCycleDependencies >> cycleCalculator [

	| cycleCalculator |
	cycleCalculator := MalTarjan new.
	cycleCalculator nodes: self entities.
	cycleCalculator
		edges: self entities
		from: #yourself
		toAll: self property.
	cycleCalculator run.
	^ cycleCalculator
]

{ #category : #configuration }
TLCycleDependencies >> defaultColorForNode: aNode [

	^ Color white
]

{ #category : #accessing }
TLCycleDependencies >> defaultTitle [
	^ 'Cycle Dependencies'
]

{ #category : #configuration }
TLCycleDependencies >> edgeColor [

	^ Color veryLightGray
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

{ #category : #configuration }
TLCycleDependencies >> highlightColorForNode: aNode [

	^ Color red
]

{ #category : #configuration }
TLCycleDependencies >> nodesLayout [

	^ TLTreeLayout
]

{ #category : #configuration }
TLCycleDependencies >> popup [

	^ TLPopUpAction onMouseOver
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
