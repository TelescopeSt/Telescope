"
A TLTreeExplorer is a visualization represented by a tree. You specify the root and how the tree has to calculate the nodes and you can explore it.

Instance Variables
	property:		<Object>
	root:		<Object>

property
	- xxxxx

root
	- xxxxx

"
Class {
	#name : #TLTreeExplorer,
	#superclass : #TLVisualization,
	#instVars : [
		'root',
		'property'
	],
	#category : #'Telescope-VisualizationTemplates-Core'
}

{ #category : #creation }
TLTreeExplorer class >> root: aRootEntity expandProperty: expandPropertyBlockOrSelector [
	^ self new
		root: aRootEntity;
		property: expandPropertyBlockOrSelector;
		yourself
]

{ #category : #building }
TLTreeExplorer >> buildLegend [
	self legend description: 'Expand' forColor: Color red.
	self legend description: 'Collapse' forColor: Color blue
]

{ #category : #building }
TLTreeExplorer >> buildVisualization [
	self configureInteractions.
	self styleSheet shape: TLEllipse.
	self styleSheet nodeLabel: #asString.
	self addNodeFromEntity: self root.
	super buildVisualization
]

{ #category : #layout }
TLTreeExplorer >> configLayout [
	self layout: (TLTreeLayout topToBottom levelGap: 100)
]

{ #category : #private }
TLTreeExplorer >> configureInteractions [
	| action |
	action := TLExpandCollapseNodesAction new property: self property.
	self
		addInteraction:
			(action
				withTriggerStyle: [ :triggerStyle :element | 
					triggerStyle
						shape: TLEllipse;
						width: 8;
						height: 8;
						backgroundColor:
								((element state at: #expanded ifAbsent: [ false ])
										ifTrue: [ Color blue ]
										ifFalse: [ Color red ]) ]) onClick
]

{ #category : #default }
TLTreeExplorer >> defaultTitle [
	^ 'Tree Explorer'
]

{ #category : #accessing }
TLTreeExplorer >> property [
	^ property
]

{ #category : #accessing }
TLTreeExplorer >> property: anObject [
	property := anObject
]

{ #category : #accessing }
TLTreeExplorer >> root [
	^ root
]

{ #category : #accessing }
TLTreeExplorer >> root: anObject [
	root := anObject
]
