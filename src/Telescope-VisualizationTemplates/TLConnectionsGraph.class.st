"
The idea of the connection flow graph is to have a set of starting nodes and place them at different horizontal levels according to their incoming/outgoing connections. The difference with flow graph is that the computation for levels is done by the visualization and the connections are shown to the nodes beyond their immediate neighbors. Since the visualization can represent incoming and outgoing connections, the root is placed leftMost for outgoing and rightMost for incoming connections. 

edgeDirection: #incoming or #outgoing
nextProperty = property to get next level elements (applicable to both incoming and outgoing)
entry Point: the starting point of the graph

"
Class {
	#name : #TLConnectionsGraph,
	#superclass : #TLFlowGraph,
	#instVars : [
		'elements',
		'levelsCollection',
		'connectionProperty',
		'edgeDirection'
	],
	#category : #'Telescope-VisualizationTemplates-Core'
}

{ #category : #'instance-creation' }
TLConnectionsGraph class >> root: aRootElement elements: aCollection flowDirection: aSymbol [
	^ self new rootElement: aRootElement; elements: aCollection; rootLeftMost: aSymbol
]

{ #category : #private }
TLConnectionsGraph >> addConnectionForGroupAt: aLevel [
	(self > aLevel) nodes
		do: [ :aNode | 
			(levelsCollection flatten select: [ :each | (aNode entity perform: self connectionProperty) includes: each ])
				do: [ :anEntity | 
					self edgeDirection = #incoming
						ifTrue: [ 
							[ aNode connectTo: (self nodeForEntity: anEntity) ]
								on: NotFound
								do: [  ] ]
						ifFalse: [ 
							[ (self nodeForEntity: anEntity) connectTo: aNode ]
								on: NotFound
								do: [  ] ] ] ]
]

{ #category : #building }
TLConnectionsGraph >> buildVisualization [
	self initializeElementLevels.
	self buildTheFlowFrom: (levelsCollection at: 1) currentRank: 1.
	self layout: (TLLinearLayout gap: 30).
]

{ #category : #accessing }
TLConnectionsGraph >> connectionProperty [
	^ connectionProperty
]

{ #category : #accessing }
TLConnectionsGraph >> connectionProperty: aProperty [
	connectionProperty := aProperty
]

{ #category : #accessing }
TLConnectionsGraph >> edgeDirection [
	^ edgeDirection ifNil: [ #incoming ] "other possibility is #outgoing"
]

{ #category : #accessing }
TLConnectionsGraph >> edgeDirection: anObject [
	edgeDirection := anObject
]

{ #category : #accessing }
TLConnectionsGraph >> elements [
	^ elements
]

{ #category : #accessing }
TLConnectionsGraph >> elements: anObject [
	elements := anObject
]

{ #category : #initialization }
TLConnectionsGraph >> initializeElementLevels [
	| elementsToAnalyze |
	elementsToAnalyze := self elements difference: {self entryPoint}.
	levelsCollection := OrderedCollection new.
	levelsCollection add: { self entryPoint }.
	[ elementsToAnalyze isEmpty ]
		whileFalse: [ 
			| thisLevel |
			thisLevel := OrderedCollection new.
			elementsToAnalyze
				do: [ :each | 
					((each perform: self nextProperty) anySatisfy: [ :nextElement | elementsToAnalyze includes: nextElement  ])
						ifTrue: [ thisLevel add: each ] ].
			thisLevel
				ifEmpty: [ 
					levelsCollection add: elementsToAnalyze.
					elementsToAnalyze := OrderedCollection new ]
				ifNotEmpty: [ 
					levelsCollection add: thisLevel.
					elementsToAnalyze removeAll: thisLevel ] ].
	self setLevelsOrientation
]

{ #category : #private }
TLConnectionsGraph >> nextLevelNodes: aCollection atLevel: aLevel [
	^ [(levelsCollection at: aLevel + 1)] on: SubscriptOutOfBounds do: [ #() ]
]

{ #category : #private }
TLConnectionsGraph >> setLevelsOrientation [
	self edgeDirection = #incoming
		ifTrue: [ levelsCollection := levelsCollection reversed ]
]
