"
I represent a link between two nodes.

"
Class {
	#name : #TLConnection,
	#superclass : #TLDrawable,
	#instVars : [
		'fromNode',
		'toNode'
	],
	#category : 'Telescope-Model'
}

{ #category : #'as yet unclassified' }
TLConnection class >> from: fromNode to: toNode visualization: aTLVisualization [
	^ self new fromNode: fromNode; toNode: toNode; parent: aTLVisualization
]

{ #category : #interactions }
TLConnection >> allInteractions [
	"return the local interactions only"
	^ self interactions
]

{ #category : #accessing }
TLConnection >> color: aColorOrBlock [
	self
		deprecated:
			'CyrilFerlicot - 22/04/2017: Style should be managed via the stylesheet. Use `connection styleSheet color: aColor` instead.'.
	self styleSheet backgroundColor: aColorOrBlock
]

{ #category : #accessing }
TLConnection >> connectedNodes [
	^ { self fromNode . self toNode }
]

{ #category : #style }
TLConnection >> defaultStyle [
	^ #connection
]

{ #category : #accessing }
TLConnection >> entity [
	^ nil
]

{ #category : #accessing }
TLConnection >> fromNode [
	^ fromNode
]

{ #category : #accessing }
TLConnection >> fromNode: aNode [
	aNode ifNotNil: [ aNode addOutgoingConnection: self ].
	fromNode := aNode
]

{ #category : #generation }
TLConnection >> generateWith: aTLGenerator [
	^ aTLGenerator generateConnection: self 
]

{ #category : #testing }
TLConnection >> isConnection [
	^ true
]

{ #category : #generation }
TLConnection >> isVisible [
	^ (super isVisible and: [  self fromNode isVisible]) and: [ self toNode isVisible ]
]

{ #category : #accessing }
TLConnection >> parent: aNode [
	self assert: (aNode isNil or: [ aNode isVisualization ]) description: 'Only visualizations can have connections as childrens'.
	parent := aNode
]

{ #category : #printing }
TLConnection >> printOn: aStream [
	super printOn: aStream.
	aStream << ':('.
	self fromNode printOn: aStream.
	aStream << '->'.
	self toNode printOn: aStream.
	aStream << ')'
]

{ #category : #generation }
TLConnection >> removeWith: aTLConnector [
	aTLConnector removeConnection: self
]

{ #category : #accessing }
TLConnection >> removed [
	super removed.
	self fromNode removeOutgoingConnection: self.
	self toNode removeIncomingConnection: self.
	self fromNode: nil.
	self toNode: nil.
]

{ #category : #state }
TLConnection >> requireUpdate [
	super requireUpdate.
	"self shape updateWithDrawable: self"
]

{ #category : #accessing }
TLConnection >> toNode [
	^ toNode
]

{ #category : #accessing }
TLConnection >> toNode: aNode [
	aNode ifNotNil: [ aNode addIncomingConnection: self ].
	toNode := aNode
]

{ #category : #generation }
TLConnection >> updateWith: aGenerator [
	aGenerator updateConnection: self
]

{ #category : #accessing }
TLConnection >> withConnectedNodes [
	^ { self . self fromNode . self toNode }
]
