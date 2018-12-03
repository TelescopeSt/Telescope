"
A TLButterfly is a visualization based on a central element and two groups of elements; one on left; one on right; and both are connected to the central element.

Instance Variables
	leftEntities:		<Object>
	mainEntity:		<Object>
	rightEntities:		<Object>

leftEntities
	- xxxxx

mainEntity
	- xxxxx

rightEntities
	- xxxxx

"
Class {
	#name : #TLButterfly,
	#superclass : #TLVisualization,
	#instVars : [
		'mainEntity',
		'leftEntities',
		'rightEntities'
	],
	#category : #'Telescope-VisualizationTemplates-Core'
}

{ #category : #'instance-creation' }
TLButterfly class >> mainEntity: anEntity [
	^ self new
		mainEntity: anEntity;
		yourself
]

{ #category : #building }
TLButterfly >> buildVisualization [
	| leftEntitiesValues rightEntitiesValues |
	self styleSheet nodeLabel: #asString.
	leftEntitiesValues := (self obtain: self leftEntities on: self mainEntity) asOrderedCollection.
	rightEntitiesValues := (self obtain: self rightEntities on: self mainEntity) asOrderedCollection.
	self > #left addNodesFromEntities: leftEntitiesValues.
	self > #central addNodeFromEntity: self mainEntity.
	self > #right addNodesFromEntities: rightEntitiesValues.
	self > #left connectTo: self > #central.
	self > #central connectTo: self > #right.
	self configLabelPosition
]

{ #category : #label }
TLButterfly >> configLabelPosition [
	(self > #left) styleSheet nodeLabelPosition: #left.
	(self > #right) styleSheet nodeLabelPosition: #right.
	self styleSheet nodeLabelPosition: #top
]

{ #category : #layout }
TLButterfly >> configLayout [
	self > #left layout: TLLinearLayout topToBottom.
	self > #central layout: TLLinearLayout topToBottom.
	self > #right layout: TLLinearLayout topToBottom.
	self layout: (TLLinearLayout gap: 100)
]

{ #category : #default }
TLButterfly >> defaultTitle [
	^ 'Butterfly'
]

{ #category : #accessing }
TLButterfly >> leftEntities [
	^ leftEntities
]

{ #category : #accessing }
TLButterfly >> leftEntities: anObject [
	leftEntities := anObject
]

{ #category : #accessing }
TLButterfly >> mainEntity [
	^ mainEntity
]

{ #category : #accessing }
TLButterfly >> mainEntity: anObject [
	mainEntity := anObject
]

{ #category : #accessing }
TLButterfly >> rightEntities [
	^ rightEntities
]

{ #category : #accessing }
TLButterfly >> rightEntities: anObject [
	rightEntities := anObject
]
