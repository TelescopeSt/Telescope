"
A TLEntitiesGroup is a group of entities that can receive interactions, layout...

Instance Variables
	entities:		<Object>

entities
	- xxxxx

"
Class {
	#name : #TLEntitiesGroup,
	#superclass : #TLConnectable,
	#traits : 'TTLDrawableCollection',
	#classTraits : 'TTLDrawableCollection classTrait',
	#instVars : [
		'telescopeEntities',
		'subGroupsDictionary',
		'nodeCreationStrategy',
		'sortingStrategy'
	],
	#category : #'Telescope-Core-Model'
}

{ #category : #accessing }
TLEntitiesGroup >> > aSubGroupSymbol [
	^ self subGroupsDictionary
		at: aSubGroupSymbol
		ifAbsentPut: [ 
			TLEntitiesGroup new
				parent: self;
				yourself ]
]

{ #category : #adding }
TLEntitiesGroup >> addAbsentNodesInVisualizationFromEntities: aGroupOfEntities [
	"only add nodes for entities that are not yet in visualization"
	self flag: 'Should check that aGroupOfEntities does not contains twice the same entity'.
	^ self
		addNodesFromEntities:
		
			(aGroupOfEntities
				reject: [ :anEntity | 
					[ 
					(self visualization ifNil: [self parent ifNil: [self]])nodeForEntity: anEntity.
					true ]
						on: NotFound
						do: [ false ] ])
]

{ #category : #adding }
TLEntitiesGroup >> addAllDrawables: aCollectionOfTLDrawables [
	aCollectionOfTLDrawables do: [:each | self addDrawable: each ]
]

{ #category : #adding }
TLEntitiesGroup >> addChild: aTLDrawable [
	self telescopeEntities addLast: aTLDrawable.
	self requireUpdateAndLayoutApplication.
	
]

{ #category : #interactions }
TLEntitiesGroup >> addCompositeDefaultCollapseInteraction [
	"If the user call me, each composite node will have an interaction with a default shape to expand/collapse the node."

	self
		addInteraction:
			((TLExpandCollapseCompositeNodeAction
				withTriggerStyle: [ :triggerStyle :compositeNode | 
					compositeNode expanded
						ifFalse: [ triggerStyle nodeLabel: '+' ]
						ifTrue: [ triggerStyle nodeLabel: '-' ] ])
				condition: [ :drawable | drawable isNode and: [ drawable isComposite and: [ drawable hasChildren ] ] ];
				onClick)
]

{ #category : #adding }
TLEntitiesGroup >> addCompositeNodeFromEntity: aParentEntity children: aCollectionOfEntities [ 
	|composite|
	composite := (TLCompositeNode withEntity: aParentEntity).
	self addDrawable: composite.
	composite childrenGroup nodeCreationStrategy: TLNodeCreationStrategy default; addNodesFromEntities: aCollectionOfEntities.
	^ composite
]

{ #category : #adding }
TLEntitiesGroup >> addDrawable: aTLDrawable [
	aTLDrawable parent: self.
	self applySortingStrategy.
	^ aTLDrawable 
]

{ #category : #adding }
TLEntitiesGroup >> addNodeFromEntity: anEntity [
	^ self addNodeFromEntity: anEntity withStrategy: self nodeCreationStrategy
]

{ #category : #adding }
TLEntitiesGroup >> addNodeFromEntity: anEntity withStrategy: aTLNodeCreationStrategy [
	| newNode |
	newNode := aTLNodeCreationStrategy createNodeFromEntity: anEntity.
	self addDrawable: newNode.
	^ newNode
]

{ #category : #adding }
TLEntitiesGroup >> addNodeIfNotPresentFromEntity: anElement [
	^ self nodes detect: [ :n | n entity = anElement ] ifNone: [ self addNodeFromEntity: anElement ]
]

{ #category : #adding }
TLEntitiesGroup >> addNodesFromEntities: aGroupOfEntities [
	^ self addNodesFromEntities: aGroupOfEntities withStrategy: self nodeCreationStrategy
]

{ #category : #adding }
TLEntitiesGroup >> addNodesFromEntities: aGroupOfEntities withStrategy: aTLNodeCreationStrategy [
	^ aGroupOfEntities collect: [ :anEntity | self addNodeFromEntity: anEntity withStrategy: aTLNodeCreationStrategy ] as: TLDrawableCollection
]

{ #category : #sorting }
TLEntitiesGroup >> applySortingStrategy [
	self sortingStrategy sortNodes: self collection.
]

{ #category : #'node - creation' }
TLEntitiesGroup >> childrenProperty: aValuableOrCollection [
	"Ensure that we will not modify an upper level strategy"
	self flag: 'Maybe should be in the stylesheet'.
	^ self localNodeCreationStrategy compositeProperty: aValuableOrCollection
]

{ #category : #enumerating }
TLEntitiesGroup >> collect: aBlockClosure [ 
	^ self telescopeEntities collect: aBlockClosure 
]

{ #category : #requirements }
TLEntitiesGroup >> collection [
	^ self telescopeEntities
]

{ #category : #connect }
TLEntitiesGroup >> connectInsideGroupEntities: aCollectionOfEntities to: anotherCollectionOfEntities [
	^ aCollectionOfEntities flatCollect: [ :fromEntity | anotherCollectionOfEntities collect: [ :toEntity | self connectInsideGroupEntity: fromEntity to: toEntity ]]
]

{ #category : #connect }
TLEntitiesGroup >> connectInsideGroupEntity: anEntity to: anotherEntity [
	^ (self nodeForEntity: anEntity) connectTo: (self nodeForEntity: anotherEntity)
]

{ #category : #connect }
TLEntitiesGroup >> connectInsideGroupEntity: anEntity toEntity: anotherEntity FromAnotherGroup: anotherGroup [
	^ (self nodeForEntity: anEntity) connectTo: (anotherGroup nodeForEntity: anotherEntity)
]

{ #category : #connect }
TLEntitiesGroup >> connectableParent [
	^ self parent
]

{ #category : #style }
TLEntitiesGroup >> defaultStyle [
	^ #group
]

{ #category : #enumerating }
TLEntitiesGroup >> do: aBlock [
	self telescopeEntities do: aBlock
]

{ #category : #enumerating }
TLEntitiesGroup >> flatCollect: aBlock [
	^ self telescopeEntities flatCollect: aBlock
]

{ #category : #'private-connector' }
TLEntitiesGroup >> generateWith: aGenerator [
	| generated |
	generated := aGenerator generateGroup: self.
	self hierarchyChangeManaged.
	^ generated
]

{ #category : #groupId }
TLEntitiesGroup >> groupId [
	^ self parent subGroupsDictionary keyAtValue: self
]

{ #category : #private }
TLEntitiesGroup >> hierarchyHasChanged [
	| changedBefore |
	changedBefore := self hierarchyChanged.
	super hierarchyHasChanged.	"In addition to parent, we notify children if this node was not notified before"
	changedBefore
		ifFalse: [ self do: #hierarchyHasChanged ]
]

{ #category : #testing }
TLEntitiesGroup >> ifEmpty: aBlockClosure ifNotEmpty: aBlockClosure2 [
	^ self collection ifEmpty: aBlockClosure ifNotEmpty: aBlockClosure2
]

{ #category : #test }
TLEntitiesGroup >> includes: aTLDrawable [
	^ self telescopeEntities includes: aTLDrawable
]

{ #category : #position }
TLEntitiesGroup >> indexOf: aTLDrawable [
	^ self telescopeEntities indexOf: aTLDrawable
]

{ #category : #initialization }
TLEntitiesGroup >> initialize [
	super initialize.
	telescopeEntities := TLDrawableCollection new.
	subGroupsDictionary := Dictionary new.
	sortingStrategy := TLKeepingOrderStrategy new
]

{ #category : #test }
TLEntitiesGroup >> isEmpty [
	^ self telescopeEntities isEmpty
]

{ #category : #test }
TLEntitiesGroup >> isGroup [
	^ true
]

{ #category : #accessing }
TLEntitiesGroup >> layout [
	^ (self parent notNil and: [ self parent isNode ])
		ifTrue: [ self effectiveStyleSheet obtainValue: #layout forEntity: self parent entity inNode: self parent ]
		ifFalse: [ self effectiveStyleSheet layout ]
]

{ #category : #accessing }
TLEntitiesGroup >> layout: aLayout [
	self requireLayoutApplication.
	self styleSheet layout: aLayout
]

{ #category : #'node - creation' }
TLEntitiesGroup >> localNodeCreationStrategy [
	^ nodeCreationStrategy ifNil: [ nodeCreationStrategy := (self nodeCreationStrategy ifNil: [ Halt now ]) copyAsSimpleStrategy ]
]

{ #category : #position }
TLEntitiesGroup >> moveToFirstPosition: aNode [
	self assert: (self includes: aNode). 
	self telescopeEntities addFirst: (self telescopeEntities remove: aNode).
	self requireUpdateAndLayoutApplication
]

{ #category : #style }
TLEntitiesGroup >> nodeBackgroundColor: aColor [ 
	self styleSheet backgroundColor: aColor.
]

{ #category : #'node - creation' }
TLEntitiesGroup >> nodeChildrenProperty: aChildrenBlockOrSelector [ 
	self localNodeCreationStrategy compositeProperty: aChildrenBlockOrSelector.
]

{ #category : #accessing }
TLEntitiesGroup >> nodeCreationStrategy [
	^ nodeCreationStrategy ifNil: [ self parent nodeCreationStrategy ]
]

{ #category : #accessing }
TLEntitiesGroup >> nodeCreationStrategy: anObject [
	nodeCreationStrategy := anObject
]

{ #category : #testing }
TLEntitiesGroup >> notEmpty [
	^ self collection notEmpty.
]

{ #category : #accessing }
TLEntitiesGroup >> remove: aTLDrawable [
	self removeChild: aTLDrawable.
	aTLDrawable removed
]

{ #category : #accessing }
TLEntitiesGroup >> removeAll [
	self telescopeEntities copy do: [ :anEntity | self remove: anEntity ]
]

{ #category : #removing }
TLEntitiesGroup >> removeChild: aTLDrawable [
	self telescopeEntities remove: aTLDrawable.
	self requireUpdateAndLayoutApplication.
]

{ #category : #accessing }
TLEntitiesGroup >> removeEntity: anObject [
	| drawable |
	drawable := self nodeForEntity: anObject.
	self remove: drawable
]

{ #category : #'private-connector' }
TLEntitiesGroup >> removeWith: aTLConnector [
	aTLConnector removeGroup: self
]

{ #category : #enumerating }
TLEntitiesGroup >> select: aValuable [
	^ self telescopeEntities select: aValuable
]

{ #category : #enumerating }
TLEntitiesGroup >> select: aValuable thenCollect: anotherValuable [ 
	^ self telescopeEntities select: aValuable thenCollect: anotherValuable.
]

{ #category : #accessing }
TLEntitiesGroup >> size [
	^ self telescopeEntities size
]

{ #category : #sorting }
TLEntitiesGroup >> sort: aBlockClosure [ 
	self collection sort: aBlockClosure 
]

{ #category : #accessing }
TLEntitiesGroup >> sortingStrategy [
	^ sortingStrategy
]

{ #category : #requirements }
TLEntitiesGroup >> sortingStrategy: anObject [
	sortingStrategy := anObject.
	self collection ifNotEmpty: [self applySortingStrategy].
	
]

{ #category : #accessing }
TLEntitiesGroup >> subGroups [
	^ subGroupsDictionary values
]

{ #category : #accessing }
TLEntitiesGroup >> subGroupsDictionary [
	^ subGroupsDictionary
]

{ #category : #accessing }
TLEntitiesGroup >> subGroupsDictionary: anObject [
	subGroupsDictionary := anObject
]

{ #category : #accessing }
TLEntitiesGroup >> telescopeEntities [
	^ telescopeEntities
]

{ #category : #accessing }
TLEntitiesGroup >> telescopeEntities: anObject [
	telescopeEntities := anObject
]

{ #category : #'private-connector' }
TLEntitiesGroup >> updateWith: aTLGenerator [
	aTLGenerator updateGroup: self
]
