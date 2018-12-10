"
A TLDistributionMap is a visualization where the user specify a collection of container entities, how to get inner elements and a property to apply on those elements. It will create a map with big boxes for container; with small boxes (one for each inner entity) colored depending on the property.

Containers are put in the containers group (self > #containers)

Instance Variables
	colorToProperty:		<Object>
	containerEntities:		<Object>
	innerEntities:		<Object>
	property:		<Object>

colorToProperty
	- xxxxx

containerEntities
	- xxxxx

innerEntities
	- xxxxx

property
	- xxxxx

"
Class {
	#name : #TLDistributionMap,
	#superclass : #TLVisualization,
	#instVars : [
		'containerEntities',
		'property',
		'innerEntitiesPopupBlock',
		'propertySortingBlock',
		'innerEntitiesSelector'
	],
	#category : #'Telescope-VisualizationTemplates-Core'
}

{ #category : #creation }
TLDistributionMap class >> containerEntities: aCollectionOfEntities innerEntities: innerEntitiesPropertyOrBlock property: legendProperty [
	^ self new
		containerEntities: aCollectionOfEntities;
		innerEntitiesSelector: innerEntitiesPropertyOrBlock;
		property: legendProperty
]

{ #category : #building }
TLDistributionMap >> buildLegend [
	super buildLegend.
	self legend backgroundDescription: [ :entity | (property cull: entity) asString ] forNodes: [ (self > #containers) allChildrenNodes ]
]

{ #category : #building }
TLDistributionMap >> buildVisualization [
	super buildVisualization.
	(self > #containers) nodeCreationStrategy
		childrenProperty: [ :containerEntity | self innerEntitiesSelector cull: containerEntity ];
		childrenSortingStrategy:
			(self propertySortingBlock
				ifNil: [ TLPropertyBasedStrategy onProperty: self property ]
				ifNotNil: [ :blk | 
					TLSortingBlockStrategy
						sortingBlock: [ :node1 :node2 | blk value: (self property value: node1 entity) value: (self property value: node2 entity) ] ]).
	((self > #containers) styleSheet > #children)
		backgroundColor: self createColorBlock;
		noNodeLabel.
	(self > #containers) styleSheet
		nodeLabel: #asString position: #top;
		backgroundColor: Color white.
	self > #containers addNodesFromEntities: self containerEntities.

	"sort the containers AFTER they are all added to the visualization because the
	sorting is rather heavy, we want to do it once for all"
	self > #containers sortingStrategy: (TLDistributionMapContainerSortingStrategy onDistributionMap: self).
	(self > #containers) allChildrenNodes
		addInteraction: (TLPopUpAction text: [ :entity | self obtain: self innerEntitiesPopupBlock on: entity ]) onMouseOver
]

{ #category : #layout }
TLDistributionMap >> configLayout [
	self > #containers layout: (TLLinearLayout gap: 20 ratio: 16/9)
]

{ #category : #accessing }
TLDistributionMap >> containerEntities [
	^ containerEntities
]

{ #category : #accessing }
TLDistributionMap >> containerEntities: aCollectionOfObjects [
	self
		assert: aCollectionOfObjects isCollection
		description: 'Container entities must be a collection'.
	containerEntities := aCollectionOfObjects
]

{ #category : #private }
TLDistributionMap >> createColorBlock [
	| sortedProperties colorsMap |
	sortedProperties := self obtainPropertyValuesSortedByFrequency.
	colorsMap := ((Color wheel: sortedProperties size)
		collectWithIndex: [ :aColor :anIndex | (sortedProperties at: anIndex) -> aColor ])
		asDictionary.
	^ [ :anEntity | 
	| color |
	color := colorsMap
		at: (self property value: anEntity)
		ifAbsent: [ self defaultColor ].
	color ]
]

{ #category : #default }
TLDistributionMap >> defaultColor [
	^ Color gray
]

{ #category : #default }
TLDistributionMap >> defaultTitle [
	^ 'Distribution Map'
]

{ #category : #initialization }
TLDistributionMap >> initialize [
	super initialize.
	self styleSheet compositeExpandedByDefault: true
]

{ #category : #accessing }
TLDistributionMap >> innerEntities [
	self deprecated: 'Use #innerEntitiesSelector' transformWith: '`@receiver innerEntities `@statements' -> '`@receiver innerEntitiesSelector'.
	^ self innerEntitiesSelector
]

{ #category : #accessing }
TLDistributionMap >> innerEntities: anObject [
	self deprecated: 'Use #innerEntitiesSelector:' transformWith: '`@receiver innerEntities: `@statements' -> '`@receiver innerEntitiesSelector: `@statements'.
	^ self innerEntitiesSelector: anObject
]

{ #category : #accessing }
TLDistributionMap >> innerEntitiesPopupBlock [
	^ innerEntitiesPopupBlock ifNil: [ innerEntitiesPopupBlock := #asString ]
]

{ #category : #accessing }
TLDistributionMap >> innerEntitiesPopupBlock: anObject [
	innerEntitiesPopupBlock := anObject
]

{ #category : #accessing }
TLDistributionMap >> innerEntitiesSelector [
	^ innerEntitiesSelector
]

{ #category : #accessing }
TLDistributionMap >> innerEntitiesSelector: anObject [
	innerEntitiesSelector := anObject
]

{ #category : #private }
TLDistributionMap >> obtainPropertyValuesSortedByFrequency [
	| frequencyDictionary |
	frequencyDictionary := Dictionary new.
	self containerEntities
		do: [ :container | 
			(self innerEntitiesSelector value: container)
				do: [ :innerEntity | 
					| foundProperty |
					foundProperty := self property value: innerEntity.
					frequencyDictionary
						at: foundProperty
						ifPresent: [ :frequency | frequencyDictionary at: foundProperty put: frequency + 1 ]
						ifAbsentPut: [ 1 ] ] ].
	^ (frequencyDictionary associations sorted: [ :a :b | a value > b value ]) collect: #key
]

{ #category : #accessing }
TLDistributionMap >> property [
	^ property
]

{ #category : #accessing }
TLDistributionMap >> property: anObject [
	property := anObject
]

{ #category : #accessing }
TLDistributionMap >> propertySortingBlock [
	^ propertySortingBlock
]

{ #category : #accessing }
TLDistributionMap >> propertySortingBlock: aBlock [
	propertySortingBlock := aBlock
]
