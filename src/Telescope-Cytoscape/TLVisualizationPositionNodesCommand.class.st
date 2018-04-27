"
I am the command sent to the client to place all nodes (following layout application).

You can configuration the layout applications with two parameters:
- animateLayoutApplicationDuringGeneration : If this is set to true, then the visualization will be animated while been displayed the first time
- animationDuration: The duration for the animation of the layout application
"
Class {
	#name : #TLVisualizationPositionNodesCommand,
	#superclass : #TLVisualizationServerCommand,
	#instVars : [
		'nodes',
		'triggers'
	],
	#classVars : [
		'AnimateLayoutApplicationDuringGeneration',
		'AnimationDuration'
	],
	#category : 'Telescope-Cytoscape-Commands'
}

{ #category : #accessing }
TLVisualizationPositionNodesCommand class >> animateLayoutApplicationDuringGeneration [
	^ AnimateLayoutApplicationDuringGeneration
]

{ #category : #accessing }
TLVisualizationPositionNodesCommand class >> animateLayoutApplicationDuringGeneration: anObject [
	AnimateLayoutApplicationDuringGeneration := anObject
]

{ #category : #accessing }
TLVisualizationPositionNodesCommand class >> animationDuration [
	^ AnimationDuration
]

{ #category : #accessing }
TLVisualizationPositionNodesCommand class >> animationDuration: anObject [
	AnimationDuration := anObject
]

{ #category : #command }
TLVisualizationPositionNodesCommand class >> command [
	^ #positioning
]

{ #category : #initialization }
TLVisualizationPositionNodesCommand class >> initialize [
	self animateLayoutApplicationDuringGeneration: false.
	self animationDuration: 1000
]

{ #category : #adding }
TLVisualizationPositionNodesCommand >> addAllNodes: aCollectionOfTLVirtualElements [
	aCollectionOfTLVirtualElements
		do: [ :anElement | 
			anElement isNode
				ifTrue: [ 
					self nodes add: anElement.
					self addAllNodes: anElement children.
					self addAllTriggers: anElement triggers ] ]
]

{ #category : #adding }
TLVisualizationPositionNodesCommand >> addAllTriggers: aCollectionOfTLVirtualTriggers [
	aCollectionOfTLVirtualTriggers
		do: [ :aTrigger | 
			aTrigger isNode
				ifTrue: [ self triggers add: aTrigger ] ]
]

{ #category : #accessing }
TLVisualizationPositionNodesCommand >> allElementsPositions [
	"ensure that positions of nodes are refresh before the position of triggers"

	| positions |
	positions := self nodes
		reject: #hasChildren
		thenCollect: [ :aNode | 
			aNode nodeId asString
				->
					{(#x -> aNode cytoscapePosition x).
					(#y -> aNode cytoscapePosition y)} asDictionary ].
	self triggers
		do: [ :aTrigger | 
			aTrigger nodeId asString
				->
					{(#x -> aTrigger cytoscapePosition x).
					(#y -> aTrigger cytoscapePosition y)} asDictionary ].
	^ positions
]

{ #category : #accessing }
TLVisualizationPositionNodesCommand >> animateLayoutApplicationDuringGeneration [
	^ self class animateLayoutApplicationDuringGeneration
]

{ #category : #accessing }
TLVisualizationPositionNodesCommand >> animationDuration [
	self nodes ifEmpty: [ ^ 0 ].
	
	(self visualization hasBeenGenerated or: [ self animateLayoutApplicationDuringGeneration ]) ifFalse: [ ^ 0 ].
	
	^ self defaultAnimationDuration
]

{ #category : #accessing }
TLVisualizationPositionNodesCommand >> defaultAnimationDuration [
	^ self class animationDuration
]

{ #category : #action }
TLVisualizationPositionNodesCommand >> ifNotEmpty: aBlockClosure [
	self nodes ifNotEmpty: aBlockClosure
]

{ #category : #initialization }
TLVisualizationPositionNodesCommand >> initialize [
	super initialize.
	self nodes: Set new.
]

{ #category : #json }
TLVisualizationPositionNodesCommand >> neoJsonOn: writer [
	writer
		writeMapStreamingDo: [ :jsonMapWriter | 
			jsonMapWriter writeKey: #command value: self class command.
			jsonMapWriter writeKey: #visuId value: self visuId.
			jsonMapWriter
				writeKey: #layout
				value:
					{(#name -> 'preset').
					(#animate -> true).
					(#animationDuration -> self animationDuration).
					(#positions -> self allElementsPositions asDictionary)} asDictionary ]
]

{ #category : #accessing }
TLVisualizationPositionNodesCommand >> nodes [
	^ nodes 
]

{ #category : #accessing }
TLVisualizationPositionNodesCommand >> nodes: anObject [
	nodes := anObject.
	triggers := Set new
]

{ #category : #accessing }
TLVisualizationPositionNodesCommand >> triggers [
	^ triggers 
]

{ #category : #accessing }
TLVisualizationPositionNodesCommand >> triggers: anObject [
	triggers := anObject
]

{ #category : #accessing }
TLVisualizationPositionNodesCommand >> visualization [
	^ self nodes anyOne realNode visualization
]
