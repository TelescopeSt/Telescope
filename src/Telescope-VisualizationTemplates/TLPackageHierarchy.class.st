"
This visualization represents the visualization of overall hierarchy of packagesfrom Moose.
"
Class {
	#name : #TLPackageHierarchy,
	#superclass : #TLVisualization,
	#instVars : [
		'entities',
		'nameProperty',
		'property',
		'widthProperty',
		'heightProperty'
	],
	#category : #'Telescope-VisualizationTemplates-Core'
}

{ #category : #building }
TLPackageHierarchy >> buildVisualization [
	self styleSheet > #connection > #head shape: TLNoShape.
	
	(self > #packages) styleSheet
		nodeLabel: self nameProperty position: #top;
		labelSize: 10;
		width: (self widthProperty ifNil: [ 30 ]);
		height: (self heightProperty ifNil: [ 30 ]);
		textColor: Color black.
		
	(self > #packages)
		addNodesFromEntities: self entities;
		connectFollowingProperty: self property;
		addInteraction: TLPopUpAction onMouseOver;
		layout:
			(TLTreeLayout new
				leavesGap: 100;
				levelGap: 100;
				yourself)
]

{ #category : #accessing }
TLPackageHierarchy >> entities [
	^ entities
]

{ #category : #accessing }
TLPackageHierarchy >> entities: anObject [
	entities := anObject
]

{ #category : #accessing }
TLPackageHierarchy >> heightProperty [
	^ heightProperty
]

{ #category : #accessing }
TLPackageHierarchy >> heightProperty: anObject [
	heightProperty := anObject
]

{ #category : #accessing }
TLPackageHierarchy >> nameProperty [
	^ nameProperty
]

{ #category : #accessing }
TLPackageHierarchy >> nameProperty: anObject [
	nameProperty := anObject
]

{ #category : #accessing }
TLPackageHierarchy >> property [
	^ property
]

{ #category : #accessing }
TLPackageHierarchy >> property: anObject [
	property := anObject
]

{ #category : #accessing }
TLPackageHierarchy >> widthProperty [
	^ widthProperty
]

{ #category : #accessing }
TLPackageHierarchy >> widthProperty: anObject [
	widthProperty := anObject
]
