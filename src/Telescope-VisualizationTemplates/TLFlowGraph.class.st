"
A TLFlowGraph is a visualization where the user specify an entry point and a property to calculate the next entities.
It It will create a graph flow which begin with the entity given as entry point and it will show the path that you can follow.

Instance Variables
	entryPoint:		<Object>
	nextProperty:		<Object>
	rank:		<Object>

entryPoint
	- xxxxx

nextProperty
	- xxxxx

rank
	- xxxxx

"
Class {
	#name : #TLFlowGraph,
	#superclass : #TLVisualization,
	#instVars : [
		'entryPoint',
		'nextProperty'
	],
	#category : #'Telescope-VisualizationTemplates'
}

{ #category : #private }
TLFlowGraph >> addConnectionForGroupAt: anIntegerRank [
	^ (self > anIntegerRank) nodes
		do: [ :aNode | (self nextProperty cull: aNode entity) do: [ :anEntity | aNode connectTo: (self nodeForEntity: anEntity) ] ]
]

{ #category : #private }
TLFlowGraph >> addNodes: aCollectionOfObjects At: anIntegerRank [
	self
		deprecated: 'Use #addNodes:at: instead. (Cyril Ferlicot 20/04/2017. Remove this method in some months)'.
	self addNodes: aCollectionOfObjects at: anIntegerRank
]

{ #category : #private }
TLFlowGraph >> addNodes: aCollectionOfObjects at: anIntegerRank [
	self > anIntegerRank
		addNodesFromEntities: aCollectionOfObjects;
		layout: (TLLinearLayout topToBottom gap: 30)
]

{ #category : #private }
TLFlowGraph >> buildTheFlowFrom: aCollectionOfObjects currentRank: anIntegerRank [
	aCollectionOfObjects
		ifNotEmpty: [ 
			self addNodes: aCollectionOfObjects at: anIntegerRank.
			self buildTheFlowFrom: (self nextLevelNodes: aCollectionOfObjects atLevel: anIntegerRank) currentRank: anIntegerRank + 1.
			self addConnectionForGroupAt: anIntegerRank ]
]

{ #category : #building }
TLFlowGraph >> buildVisualization [
	self buildTheFlowFrom: {self entryPoint} currentRank: 1.
	self layout: (TLLinearLayout gap: 30).
]

{ #category : #accessing }
TLFlowGraph >> entryPoint [
	^ entryPoint
]

{ #category : #accessing }
TLFlowGraph >> entryPoint: anObject [
	entryPoint := anObject
]

{ #category : #private }
TLFlowGraph >> nextLevelNodes: aCollectionOfObjects atLevel: aLevel [
	^ (self removeDuplicatesIn: (aCollectionOfObjects flatCollect: [ :anObject | self nextProperty cull: anObject ]))
		reject: [ :anEntity | 
			[ 
			self nodeForEntity: anEntity.
			true ]
				on: NotFound
				do: [ false ] ]
]

{ #category : #accessing }
TLFlowGraph >> nextProperty [
	^ nextProperty
]

{ #category : #accessing }
TLFlowGraph >> nextProperty: anObject [
	nextProperty := anObject
]

{ #category : #accessing }
TLFlowGraph >> removeDuplicatesIn: aCollection [
	"Copy of an eyesee method; should be in Collection"
	| newCollection |
	newCollection := OrderedCollection new.
	aCollection
		do:
			[:each | (newCollection includes: each) ifFalse: [newCollection add: each]].
	^newCollection
]
