"
A TLPathBuilder is a visualization where the user specify an origin and the way to get entities before or after another element. The user will be able to explore the path following links and keep some nodes to create a path

Instance Variables
	incomingBlock:		<Object>
	origin:		<Object>
	outgoingBlock:		<Object>

incomingBlock
	- xxxxx

origin
	- xxxxx

outgoingBlock
	- xxxxx

"
Class {
	#name : #TLPathBuilder,
	#superclass : #TLVisualization,
	#instVars : [
		'origin',
		'incomingBlock',
		'outgoingBlock'
	],
	#category : #'Telescope-VisualizationTemplates-Core'
}

{ #category : #building }
TLPathBuilder >> buildVisualization [
	| showNodesAction |
	self defineStructure.
	
	self styleSheet nodeLabel: #asString position: #top.
	
	self > #callNodes addNodeFromEntity: self origin.
	
	showNodesAction := TLCustomAction block: [ :aNode | self showNodesFor: aNode ].
	(self > #callNodes)
		addInteraction: (showNodesAction withMenu: 'Show links (left click)');
		addInteraction: showNodesAction onClick.
		
	self defineLinkedCallsInteractions
]

{ #category : #building }
TLPathBuilder >> defineLinkedCallsInteractions [
	| keepNodeAction keepNodeMenuInteraction |
	keepNodeAction := TLCustomAction block: [ :node | self keepNode: node ].
	keepNodeMenuInteraction := keepNodeAction withMenu: 'Keep Node (Right Click)'.
	self > #incomingCalls
		addInteraction: keepNodeAction onRightClick;
		addInteraction: keepNodeMenuInteraction.
	self > #outgoingCalls
		addInteraction: keepNodeAction onRightClick;
		addInteraction: keepNodeMenuInteraction
]

{ #category : #building }
TLPathBuilder >> defineStructure [
	self layout: (TLLinearLayout gap: 60).
	self > #incomingCalls
		layout:
			(TLLinearLayout topToBottom
				gap: 20;
				yourself).
	self > #callNodes
		layout:
			(TLLinearLayout new
				verticalGap: 40;
				horizontalGap: 60).
	self > #outgoingCalls
		layout:
			(TLLinearLayout topToBottom
				gap: 20;
				yourself)
]

{ #category : #accessing }
TLPathBuilder >> incomingBlock [
	^ incomingBlock
]

{ #category : #accessing }
TLPathBuilder >> incomingBlock: anObject [
	incomingBlock := anObject
]

{ #category : #building }
TLPathBuilder >> keepNode: aNode [
	aNode moveToGroup: self > #callNodes.	
	(self > #incomingCalls) removeAll.
	(self > #outgoingCalls) removeAll
]

{ #category : #accessing }
TLPathBuilder >> origin [
	^ origin
]

{ #category : #accessing }
TLPathBuilder >> origin: anObject [
	origin := anObject
]

{ #category : #accessing }
TLPathBuilder >> outgoingBlock [
	^ outgoingBlock
]

{ #category : #accessing }
TLPathBuilder >> outgoingBlock: anObject [
	outgoingBlock := anObject
]

{ #category : #building }
TLPathBuilder >> showNodesFor: aNode [
	(self > #incomingCalls) removeAll.
	(self > #outgoingCalls) removeAll.
	self > #incomingCalls addAbsentNodesInVisualizationFromEntities: (self incomingBlock value: aNode entity).
	self > #incomingCalls connectTo: aNode.
	self > #outgoingCalls addAbsentNodesInVisualizationFromEntities: (self outgoingBlock value: aNode entity).
	aNode connectTo: (self > #outgoingCalls)
]
