"
This visualization shows entities and their dependencies and identifies and handles cyclic dependencies.

Properties to set:
- #entities: list of entities to show
- #property: block to compute the dependencies of each entity
- #WidthBlock: / #heightBlock: block to compute the width/height of each entity displayed
"
Class {
	#name : 'TLCycleDependencies',
	#superclass : 'TLVisualization',
	#instVars : [
		'entities',
		'property',
		'widthBlock',
		'heightBlock'
	],
	#category : 'Telescope-VisualizationTemplates',
	#package : 'Telescope-VisualizationTemplates'
}

{ #category : 'building' }
TLCycleDependencies >> buildVisualization [

	| cycleDetector |
	cycleDetector := self cycleDetector.

	(self > #packages) styleSheet backgroundColor: [ :namespace | 
		(cycleDetector isInCycle: namespace)
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

{ #category : 'building' }
TLCycleDependencies >> cycleDetector [
	^ TLCycleDetector nodes: self entities successors: self property
]

{ #category : 'configuration' }
TLCycleDependencies >> defaultColorForNode: aNode [

	^ Color white
]

{ #category : 'accessing' }
TLCycleDependencies >> defaultTitle [
	^ 'Cycle Dependencies'
]

{ #category : 'configuration' }
TLCycleDependencies >> edgeColor [

	^ Color veryLightGray
]

{ #category : 'accessing' }
TLCycleDependencies >> entities [
	^ entities
]

{ #category : 'accessing' }
TLCycleDependencies >> entities: anObject [
	entities := anObject
]

{ #category : 'accessing' }
TLCycleDependencies >> heightBlock [
	^ heightBlock
]

{ #category : 'accessing' }
TLCycleDependencies >> heightBlock: anObject [
	heightBlock := anObject
]

{ #category : 'configuration' }
TLCycleDependencies >> highlightColorForNode: aNode [

	^ Color red
]

{ #category : 'configuration' }
TLCycleDependencies >> nodesLayout [

	^ TLTreeLayout
]

{ #category : 'configuration' }
TLCycleDependencies >> popup [

	^ TLPopUpAction onMouseOver
]

{ #category : 'accessing' }
TLCycleDependencies >> property [
	^ property
]

{ #category : 'accessing' }
TLCycleDependencies >> property: anObject [
	property := anObject
]

{ #category : 'accessing' }
TLCycleDependencies >> widthBlock [
	^ widthBlock
]

{ #category : 'accessing' }
TLCycleDependencies >> widthBlock: anObject [
	widthBlock := anObject
]
