"
A star visualization should a root at the center and other nodes circled around the center node.

TLStarVisualization new centerNode: 1; aroundNodes: [:n | (2 to: 25) asOrderedCollection]; open
"
Class {
	#name : #TLStarVisualization,
	#superclass : #TLVisualization,
	#instVars : [
		'centerNode',
		'aroundNodes',
		'userBlock',
		'defaultInteraction'
	],
	#category : 'Telescope-Visualizations'
}

{ #category : #accessing }
TLStarVisualization >> aroundNodes [
	^ aroundNodes
]

{ #category : #accessing }
TLStarVisualization >> aroundNodes: anObject [
	aroundNodes := anObject
]

{ #category : #building }
TLStarVisualization >> buildInteractionActions [
	self > #center
		addInteraction: (TLPopUpAction text: #asString) onMouseOver;
		addNodeFromEntity: self centerNode.
	self > #around
		addInteraction: (TLPopUpAction text: #asString) onMouseOver.
	defaultInteraction
		ifTrue: [ self > #around addInteraction: self selectNodeInteraction ]
]

{ #category : #building }
TLStarVisualization >> buildVisualization [
	self styleSheet nodeLabel: #asString position: #insideCentered.
	self styleSheet shape: TLEllipse.
	self buildInteractionActions.
	self > #around addNodesFromEntities: (self aroundNodes value: self centerNode).
	self > #center connectTo: self > #around.
	self layout: self clusterLayout
]

{ #category : #accessing }
TLStarVisualization >> centerNode [
	^ centerNode
]

{ #category : #accessing }
TLStarVisualization >> centerNode: anObject [
	centerNode := anObject
]

{ #category : #layout }
TLStarVisualization >> clusterLayout [
	^ (RTClusterLayout new horizontalGap: 200)
]

{ #category : #building }
TLStarVisualization >> configLayout [
	(self > #around) layout: RTCircleLayout
]

{ #category : #private }
TLStarVisualization >> enableDefaultInteraction [
	"the default interaction is to select the peripherals elements as the center node, by default disabled"
	defaultInteraction := true
	
]

{ #category : #building }
TLStarVisualization >> initialize [
	super initialize.
	defaultInteraction := false
]

{ #category : #private }
TLStarVisualization >> moveInCenter: aNode [
	(self > #center) removeAll.
	aNode moveToGroup: (self > #center).
	(self > #around) removeAll.
	self > #around addNodesFromEntities: (self aroundNodes value: aNode entity).
	self > #center connectTo: self > #around.
	self layout: self clusterLayout.
	self update
]

{ #category : #private }
TLStarVisualization >> selectNodeInteraction [
	^ (TLCustomAction block: [ :node | self moveInCenter: node. userBlock value: node ] ) withMenu: 'Select'
]

{ #category : #accessing }
TLStarVisualization >> userBlock [
	^ userBlock ifNil: [userBlock := [:aNode | ]. userBlock ]
]

{ #category : #accessing }
TLStarVisualization >> userBlock: anObject [
	userBlock := anObject
]
