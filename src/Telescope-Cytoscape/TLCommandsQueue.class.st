"
I am a queue that manage the commands scheduling logic. I will group all the adding commands because Cytoscape does not manage correctly child adding to a composite node and also the updating for the same reason. The order is:

1) Removing commands / customizing commands
2) adding commands
3) positioning commands
"
Class {
	#name : #TLCommandsQueue,
	#superclass : #TLObject,
	#instVars : [
		'removingCustomizingCommands',
		'addingCommand',
		'positionNodesCommand',
		'visuId'
	],
	#category : 'Telescope-Cytoscape-Connector'
}

{ #category : #'as yet unclassified' }
TLCommandsQueue >> addCommand: aTLVisualizationServerCommand [
	aTLVisualizationServerCommand isAddingCommand
		ifFalse: [ self removingCustomizingCommands addLast: aTLVisualizationServerCommand ]
		ifTrue: [ self addingCommand addAddingCommand: aTLVisualizationServerCommand ]
]

{ #category : #accessing }
TLCommandsQueue >> addingCommand [
	^ addingCommand
]

{ #category : #accessing }
TLCommandsQueue >> addingCommand: anObject [
	addingCommand := anObject
]

{ #category : #initialization }
TLCommandsQueue >> clear [
	self removingCustomizingCommands: OrderedCollection new.
	self addingCommand: TLVisualizationMultiAddingCommand new.
	self positionNodesCommand: TLVisualizationPositionNodesCommand new.
	self visuId ifNotNil: [ self visuId: self visuId ]
]

{ #category : #initialization }
TLCommandsQueue >> initialize [
	super initialize.
	self clear
]

{ #category : #'node-positioning' }
TLCommandsQueue >> managePositioningOf: group [
	group ifEmpty: [ ^ self ].
	
	self positionNodesCommand addAllNodes: group
]

{ #category : #accessing }
TLCommandsQueue >> positionNodesCommand [
	^ positionNodesCommand
]

{ #category : #accessing }
TLCommandsQueue >> positionNodesCommand: anObject [
	positionNodesCommand := anObject
]

{ #category : #'as yet unclassified' }
TLCommandsQueue >> removeAllCommands [
	| commands |
	self addingCommand ifNotEmpty: [ self removingCustomizingCommands addLast: self addingCommand ].
	self positionNodesCommand ifNotEmpty: [ self removingCustomizingCommands addLast: self positionNodesCommand ].
	commands := self removingCustomizingCommands.
	self clear.
	^ commands
]

{ #category : #accessing }
TLCommandsQueue >> removingCustomizingCommands [
	^ removingCustomizingCommands
]

{ #category : #accessing }
TLCommandsQueue >> removingCustomizingCommands: anObject [
	removingCustomizingCommands := anObject
]

{ #category : #accessing }
TLCommandsQueue >> visuId [
	^ visuId
]

{ #category : #accessing }
TLCommandsQueue >> visuId: aVisuId [
	visuId := aVisuId.
	self addingCommand visuId: aVisuId.
	self positionNodesCommand visuId: aVisuId
]
