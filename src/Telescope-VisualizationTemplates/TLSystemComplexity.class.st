"
visu := TLSystemComplexity new
	root: Collection; property: #subclasses; open
"
Class {
	#name : #TLSystemComplexity,
	#superclass : #TLVisualization,
	#instVars : [
		'roots',
		'property',
		'container',
		'requirePropertyApplication'
	],
	#category : #'Telescope-VisualizationTemplates'
}

{ #category : #building }
TLSystemComplexity >> buildVisualization [
	self styleSheet
		expandCompositeNodes;
		backgroundColor: Color veryPaleRed.
	self styleSheet > #connection > #head shape: TLNoShape.
	(self container ifNil: [ self styleSheet > #roots ] ifNotNil: [ self styleSheet > #children > #roots ])
		width: [ :c | c instVarNames size * 5 max: 5 ];
		height: [ :c | c numberOfMethods max: 5 ];
		backgroundColor: ((MDLColor black property: #linesOfCode gradientAt: 1) to: MDLColor white at: (self roots collect: #linesOfCode) max);
		borderColor: Color black.
	(self container
		ifNotNil: [ :c | 
	(self roots groupedBy: c)
		keysAndValuesDo: [ :aContainer :children | 
			(self > #default addCompositeNodeFromEntity: aContainer children: children)
				childrenLayout:
					(TLTreeLayout new
						useOutgoingLinks;
						yourself) ].
	(self > #default) allChildrenNodes ]
		ifNil: [ (self > #default)
				layout:
					(TLTreeLayout new
						useOutgoingLinks;
						yourself);
				addNodesFromEntities: self roots;
				yourself ])
		addStyle: #roots;
		connectFollowingProperty: self property
]

{ #category : #accessing }
TLSystemComplexity >> container [
	^ container
]

{ #category : #accessing }
TLSystemComplexity >> container: anObject [
	container := anObject
]

{ #category : #default }
TLSystemComplexity >> defaultTitle [
	^ 'System Complexity'
]

{ #category : #private }
TLSystemComplexity >> feedRootsFrom: anEntity withProperty: aProperty [
	(self property value: anEntity)
		do: [ :anotherEntity | 
			roots addIfNotPresent: anotherEntity.
			self feedRootsFrom: anotherEntity withProperty: aProperty ]
]

{ #category : #initialization }
TLSystemComplexity >> initialize [
	super initialize.
	requirePropertyApplication := false
]

{ #category : #accessing }
TLSystemComplexity >> property [
	^ property
]

{ #category : #accessing }
TLSystemComplexity >> property: anObject [
	property := anObject
]

{ #category : #accessing }
TLSystemComplexity >> propertyApplicationRequired [
	requirePropertyApplication := true

]

{ #category : #accessing }
TLSystemComplexity >> requirePropertyApplication [
	^ requirePropertyApplication and: [ roots size = 1 ]

]

{ #category : #accessing }
TLSystemComplexity >> root [
	^ roots first
]

{ #category : #accessing }
TLSystemComplexity >> root: aRoot [
	self roots: aRoot asOrderedCollection.
	self propertyApplicationRequired
]

{ #category : #accessing }
TLSystemComplexity >> roots [
	self requirePropertyApplication
		ifTrue: [ self feedRootsFrom: self root withProperty: self property ].
	^ roots
]

{ #category : #accessing }
TLSystemComplexity >> roots: anObject [
	roots := anObject
]
