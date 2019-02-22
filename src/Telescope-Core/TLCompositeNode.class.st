"
A TLCompositeNode is a node that contains other nodes. It is usefull to represent for example a Class and all its functions for example.


Instance Variables
	childrenConnectingProperty:		<Object>
	childrenLayout:		<Object>
	childrenNodeBuilder:		<Object>
	childrenNodes:		<Object>
	expanded:		<Object>
	property:		<Object>

childrenConnectingProperty
	- xxxxx

childrenLayout
	- xxxxx

childrenNodeBuilder
	- xxxxx

childrenNodes
	- xxxxx

expanded
	- xxxxx

property
	- xxxxx

"
Class {
	#name : #TLCompositeNode,
	#superclass : #TLAbstractNode,
	#instVars : [
		'childrenGroup',
		'childrenProperty',
		'childrenGenerated'
	],
	#category : #'Telescope-Core-Model'
}

{ #category : #'instance-creation' }
TLCompositeNode class >> withEntity: anEntity childrenProperty: aChildrenProperty childrenNodeCreationStrategy: aChildrenNodeCreationStrategy [
	^ (self
		withEntity: anEntity)
		childrenProperty: aChildrenProperty;
		childrenNodeCreationStrategy: aChildrenNodeCreationStrategy;
		yourself
]

{ #category : #adding }
TLCompositeNode >> addChild: aTLDrawable [
	childrenGroup ifNil: [ self childrenGroup: aTLDrawable ] ifNotNil: [ self childrenGroup addChild: aTLDrawable ]
]

{ #category : #adding }
TLCompositeNode >> addChildNode: aNode [
	childrenGroup addDrawable: aNode.
]

{ #category : #'children-creation' }
TLCompositeNode >> addChildNodeFromEntity: anEntity [
	^ self addChildNodeFromEntity: anEntity withStrategy: TLNodeCreationStrategy default
]

{ #category : #'children-creation' }
TLCompositeNode >> addChildNodeFromEntity: anEntity withStrategy: aNodeCreationStrategy [
	self requireUpdateAndLayoutApplication.
	^ self childrenGroup addNodeFromEntity: anEntity withStrategy: aNodeCreationStrategy
]

{ #category : #adding }
TLCompositeNode >> addChildrenNodes: aGroupOfNodes [
	aGroupOfNodes do: [ :node | self addChildNode: node ]
]

{ #category : #children }
TLCompositeNode >> allChildrenCompositeNodes [
	|allChildrenCompositeNodes|
	allChildrenCompositeNodes := {self}, self childrenNodes select: [:each | each class = TLCompositeNode].
	^ (allChildrenCompositeNodes, (self childrenNodes flatCollect: #allChildrenCompositeNodes))
]

{ #category : #accessing }
TLCompositeNode >> allConnections [
	^ super allConnections union: self childrenGroup allConnections
]

{ #category : #children }
TLCompositeNode >> allNodesRecursively [
	^ (self childrenGroup flatCollect: #allNodesRecursively)
		add: self;
		yourself
]

{ #category : #private }
TLCompositeNode >> areChildrenGenerated [
	^ childrenGenerated ifNil: [ childrenGenerated := false ]
]

{ #category : #transformation }
TLCompositeNode >> becomeComposite [
	^ self
]

{ #category : #accessing }
TLCompositeNode >> childrenGroup [
	childrenGroup isEmpty
		ifTrue: [ 
			[ self createChildrenNodes ]
				on: TLNoChildrenPropertyException , TLCompositeChildrenAlreadyGeneratedException
				do: [ 
					"Those cases are managed and so can happen"
					 ] ].
	^ childrenGroup
]

{ #category : #accessing }
TLCompositeNode >> childrenGroup: anObject [
	childrenGroup := anObject
]

{ #category : #accessing }
TLCompositeNode >> childrenLayout [
	^ self effectiveStyleSheet childrenLayout
]

{ #category : #accessing }
TLCompositeNode >> childrenLayout: aLayout [
	self styleSheet childrenLayout: aLayout
]

{ #category : #children }
TLCompositeNode >> childrenNodeCreationStrategy: aChildrenNodeCreationStrategy [
	"we need to directly access the attribute to avoid nodes creation without strategy"
	childrenGroup nodeCreationStrategy: aChildrenNodeCreationStrategy
]

{ #category : #accessing }
TLCompositeNode >> childrenNodes [
	^ self childrenGroup nodes
]

{ #category : #accessing }
TLCompositeNode >> childrenProperty [
	^ childrenProperty
]

{ #category : #accessing }
TLCompositeNode >> childrenProperty: anObject [
	childrenProperty := anObject.
	self flag: 'Here we should return the node creation strategy of the group but the problem is that nodeCreationStrategy is not necessarly setted before' "^ childrenGroup nodeCreationStrategy"
]

{ #category : #connect }
TLCompositeNode >> connectChildrenFollowingProperty: aBlockOrSymbol [
	^ self childrenNodes connectFollowingProperty: aBlockOrSymbol
]

{ #category : #private }
TLCompositeNode >> createChildrenNodes [
	self areChildrenGenerated
		ifTrue: [ TLCompositeChildrenAlreadyGeneratedException signal ]
		ifFalse: [ childrenGenerated := true ].
	self childrenProperty ifNil: [ TLNoChildrenPropertyException signal ].
	childrenGroup
		addNodesFromEntities:
			([ self childrenProperty cull: self entity ]
				on: MessageNotUnderstood
				do: [ self childrenProperty ]) asOrderedCollection
]

{ #category : #style }
TLCompositeNode >> defaultStyle [
	^ #compositeNode
]

{ #category : #accessing }
TLCompositeNode >> entity: anEntity [
	super entity: anEntity.
	self areChildrenGenerated
		ifTrue: [ self childrenGroup removeAll ]
]

{ #category : #accessing }
TLCompositeNode >> expanded [
	(self state at: #childrenExpanded) ifNil: [ self expanded: self effectiveStyleSheet compositeExpandedByDefault ].
	^ self state at: #childrenExpanded
]

{ #category : #accessing }
TLCompositeNode >> expanded: aBoolean [
	self state at: #childrenExpanded put: aBoolean.
	self flag: 'Not sure its necessary to generate the children group if it is not visible'.
	"Not accessing through accessor because it will create all the children"
	childrenGroup isVisible: aBoolean
]

{ #category : #'private-connector' }
TLCompositeNode >> generateWith: aGenerator [
	| generated |
	generated := aGenerator generateCompositeNode: self.
	self hierarchyChangeManaged.
	^ generated
]

{ #category : #testing }
TLCompositeNode >> hasChildren [
	^ self childrenGroup notEmpty
]

{ #category : #testing }
TLCompositeNode >> hasChildrenToDisplay [
	^ self expanded and: [ self hasChildren ]
]

{ #category : #private }
TLCompositeNode >> hierarchyHasChanged [
	| changedBefore |
	changedBefore := self hierarchyChanged.
	super hierarchyHasChanged.	"In addition to parent, we notify children if this node was not notified before"
	changedBefore
		ifFalse: [ 
			self areChildrenGenerated
				ifTrue: [ self childrenGroup do: #hierarchyHasChanged ] ]
]

{ #category : #initialization }
TLCompositeNode >> initialize [
	super initialize.
	self state at: #childrenExpanded put: nil.
	TLEntitiesGroup new
		parent: self;
		addStyle: #children
]

{ #category : #testing }
TLCompositeNode >> isComposite [
	^ true
]

{ #category : #testing }
TLCompositeNode >> isCompositeNode [
	^ true
]

{ #category : #testing }
TLCompositeNode >> isExpanded [
	"This method name seems more natural than #expanded"
	
	^ self expanded
]

{ #category : #testing }
TLCompositeNode >> isLeaf [
	^ self hasChildrenToDisplay not
]

{ #category : #accessing }
TLCompositeNode >> leafs [
	^ self hasChildrenToDisplay
		ifTrue: [ self childrenGroup flatCollect: #leafs ]
		ifFalse: [ {self} ]
]

{ #category : #accessing }
TLCompositeNode >> lowestLevelNodes [
	|lowestLevelNodes|
	lowestLevelNodes := self childrenNodes reject: #hasChildren.
	^ (lowestLevelNodes, (self childrenNodes flatCollect: #lowestLevelNodes))
]

{ #category : #accessing }
TLCompositeNode >> nodeCreationStrategy [
	self error: 'nobody should ask to a composite a nodeCreationStrategy' 
]

{ #category : #enumeration }
TLCompositeNode >> nodesForEntities: aCollectionOfEntities [
	| result |
	result := self childrenGroup nodesForEntities: aCollectionOfEntities.
	(aCollectionOfEntities includes: self entity)
		ifTrue: [ result add: self ].
	^ result
]

{ #category : #removing }
TLCompositeNode >> removeChild: aTLDrawable [
	self childrenGroup remove: aTLDrawable
]

{ #category : #'private-connector' }
TLCompositeNode >> removeWith: aTLConnector [
	aTLConnector removeCompositeNode: self.
	self hierarchyChangeManaged
]

{ #category : #state }
TLCompositeNode >> requireUpdate [
	super requireUpdate.	"Not calling #requireUpdate for the children group because it will create infinite loop"
	self areChildrenGenerated
		ifTrue: [ self childrenGroup isUpdateRequired: true ]
]

{ #category : #'private-connector' }
TLCompositeNode >> updateWith: aGenerator [
	aGenerator updateCompositeNode: self.
	self hierarchyChangeManaged
]
