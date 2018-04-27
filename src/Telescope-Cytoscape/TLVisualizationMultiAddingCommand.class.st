"
I am a command that contains many adding commands to faster the execution on the client side
"
Class {
	#name : #TLVisualizationMultiAddingCommand,
	#superclass : #TLVisualizationServerCommand,
	#instVars : [
		'addingCommands'
	],
	#category : 'Telescope-Cytoscape-Commands'
}

{ #category : #command }
TLVisualizationMultiAddingCommand class >> command [
	^ #add
]

{ #category : #adding }
TLVisualizationMultiAddingCommand >> addAddingCommand: aTLVisualizationAddNodeCommand [ 
	self addingCommands addLast: aTLVisualizationAddNodeCommand .
]

{ #category : #accessing }
TLVisualizationMultiAddingCommand >> addingCommands [
	^ addingCommands
]

{ #category : #accessing }
TLVisualizationMultiAddingCommand >> addingCommands: anObject [
	addingCommands := anObject
]

{ #category : #action }
TLVisualizationMultiAddingCommand >> ifNotEmpty: aBlockClosure [
	self addingCommands ifNotEmpty: aBlockClosure
]

{ #category : #initialization }
TLVisualizationMultiAddingCommand >> initialize [
	super initialize.
	self addingCommands: OrderedCollection new.
]

{ #category : #testing }
TLVisualizationMultiAddingCommand >> isMultiAdding [
	^ true
]

{ #category : #'as yet unclassified' }
TLVisualizationMultiAddingCommand >> neoJsonOn: writer [
	writer
		writeMapStreamingDo: [ :jsonMapWriter | 
			jsonMapWriter writeKey: #command value: self class command.
			jsonMapWriter writeKey: #visuId value: self visuId.
			jsonMapWriter
				writeKey: #parameters
				value:
					self addingCommands ]
]
