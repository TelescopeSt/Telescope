"
I define the basic structure of a node for the Telescope vizualisations
"
Class {
	#name : #TLAbstractNode,
	#superclass : #TLConnectable,
	#instVars : [
		'entity',
		'label',
		'incomingConnections',
		'outgoingConnections'
	],
	#category : #'Telescope-Core-Model'
}

{ #category : #'instance-creation' }
TLAbstractNode class >> withEntity: anEntity [
	^ self new entity: anEntity
]

{ #category : #adding }
TLAbstractNode >> addIncomingConnection: aTLConnection [
	self incomingConnections add: aTLConnection.
	self requireUpdateForConnections
]

{ #category : #adding }
TLAbstractNode >> addOutgoingConnection: aTLConnection [
	self outgoingConnections add: aTLConnection.
	self requireUpdateForConnections
]

{ #category : #accessing }
TLAbstractNode >> adjacentNodes [
	^ self incomingAdjacentNodes copy;
	  addAllFirstUnlessAlreadyPresent: self outgoingAdjacentNodes;
	  yourself 
]

{ #category : #accessing }
TLAbstractNode >> allConnections [
	^ self connections
]

{ #category : #style }
TLAbstractNode >> backGroundColor [
	^ self effectiveStyleSheet backgroundColor
]

{ #category : #transformation }
TLAbstractNode >> becomeComposite [
	^ self subclassResponsibility 
]

{ #category : #accessing }
TLAbstractNode >> childrenLayout [
	^ self effectiveStyleSheet childrenLayout
]

{ #category : #accessing }
TLAbstractNode >> childrenLayout: aLayout [
	self styleSheet childrenLayout: aLayout
]

{ #category : #connect }
TLAbstractNode >> connectFollowingProperty: aBlockOrSymbol context: aTLEntitiesGroup [
	| target |
	target := aBlockOrSymbol value: self entity.
	^ (target isCollection and: [ target isString not ])
		ifTrue: [ {(self connectTo: (aTLEntitiesGroup nodesForEntities: target))} ]
		ifFalse: [ 
			[ {(self connectTo: (aTLEntitiesGroup nodeForEntity: target))} ]
				on: NotFound
				do: [ #() ] ]
]

{ #category : #connect }
TLAbstractNode >> connectFromNode: aTLNode [
	^ aTLNode connectToNode: self
]

{ #category : #connect }
TLAbstractNode >> connectIfNotFromNode: aTLNode [
	^ aTLNode connectIfNotToNode: self
]

{ #category : #connect }
TLAbstractNode >> connectIfNotTo: aTLConnectable [
	^ aTLConnectable connectIfNotFromNode: self
]

{ #category : #connect }
TLAbstractNode >> connectIfNotToNode: aTLNode [
	^ self outgoingConnections detect: [ :aConnection | aConnection toNode = aTLNode ] ifNone: [ self connectTo: aTLNode ]
]

{ #category : #connect }
TLAbstractNode >> connectThrough: connectionsValuable to: targetValuable context: aTLEntitiesGroup [
	| targets connectionEntities |
	connectionEntities := connectionsValuable value: self entity.
	targets := connectionEntities
		collect: [ :connectionEntity | connectionEntity -> (targetValuable value: connectionEntity) ].
	^ targets
		inject: OrderedCollection new
		into: [ :collection :connectionAndTarget | 
			[ 
			collection
				add: (self connectToNode: (aTLEntitiesGroup nodeForEntity: connectionAndTarget value) entity: connectionAndTarget key) ]
				on: NotFound
				do: [  ].
			collection ]
]

{ #category : #connect }
TLAbstractNode >> connectTo: aTLConnectable [
	^ aTLConnectable connectFromNode: self
]

{ #category : #connect }
TLAbstractNode >> connectTo: aTLConnectable entity: anObject [
	^ aTLConnectable connectToNode: self entity: anObject
]

{ #category : #connect }
TLAbstractNode >> connectToNode: aTLNode [
	^ TLConnection from: self to: aTLNode visualization: self visualization
]

{ #category : #connect }
TLAbstractNode >> connectToNode: aTLNode entity: anObject [
	^ (TLConnectionWithEntity
		from: self
		to: aTLNode
		visualization: self visualization)
		entity: anObject;
		yourself
]

{ #category : #accessing }
TLAbstractNode >> connections [
	^ self incomingConnections, self outgoingConnections 
]

{ #category : #style }
TLAbstractNode >> defaultStyle [
	^ #node
]

{ #category : #entity }
TLAbstractNode >> entity [
	^ entity
]

{ #category : #accessing }
TLAbstractNode >> entity: anObject [
	self requireUpdateAndLayoutApplication.
	entity := anObject
]

{ #category : #testing }
TLAbstractNode >> hasEntity [
	^ true
]

{ #category : #accessing }
TLAbstractNode >> incomingAdjacentNodes [
	^ self incomingConnections collect: #fromNode
]

{ #category : #accessing }
TLAbstractNode >> incomingConnections [
	^ incomingConnections
]

{ #category : #accessing }
TLAbstractNode >> incomingConnections: anObject [
	incomingConnections := anObject
]

{ #category : #initialization }
TLAbstractNode >> initialize [
	super initialize.
	incomingConnections := TLDrawableCollection new.
	outgoingConnections := TLDrawableCollection new.
	
]

{ #category : #testing }
TLAbstractNode >> isComposite [
	^ false
]

{ #category : #testing }
TLAbstractNode >> isLeaf [
	^ self subclassResponsibility
]

{ #category : #testing }
TLAbstractNode >> isNode [
	^ true
]

{ #category : #accessing }
TLAbstractNode >> label [
	^ label
]

{ #category : #accessing }
TLAbstractNode >> label: anObject [
	label := anObject
]

{ #category : #accessing }
TLAbstractNode >> leafs [
	^ self subclassResponsibility
]

{ #category : #enumeration }
TLAbstractNode >> nodesForEntities: aCollectionOfEntities [
	^ (aCollectionOfEntities includes: self entity)
		ifTrue: [ {self} ]
		ifFalse: [ #() ]
]

{ #category : #accessing }
TLAbstractNode >> outgoingAdjacentNodes [
	^ self outgoingConnections collect: #toNode
]

{ #category : #accessing }
TLAbstractNode >> outgoingConnections [
	^ outgoingConnections
]

{ #category : #accessing }
TLAbstractNode >> outgoingConnections: anObject [
	outgoingConnections := anObject
]

{ #category : #accessing }
TLAbstractNode >> parentNode: aNode [
	aNode becomeComposite addChildNode: self
]

{ #category : #printing }
TLAbstractNode >> printOn: stream [
	super printOn: stream.
	stream nextPutAll: ' ('.
	self entity printOn: stream.
	stream nextPutAll: ')'
]

{ #category : #connect }
TLAbstractNode >> removeIncomingConnection: aTLConnection [
	self incomingConnections remove: aTLConnection.
	self requireUpdateForConnections
]

{ #category : #connect }
TLAbstractNode >> removeOutgoingConnection: aTLConnection [
	self outgoingConnections remove: aTLConnection.
	self requireUpdateForConnections
]

{ #category : #state }
TLAbstractNode >> requireUpdateForConnections [
	"If i have no parent, no layouting required"

	self parent ifNil: [ ^ self requireUpdate ].
	self parent layout isConnectionDependant
		ifTrue: [ self requireUpdateAndLayoutApplication ]
		ifFalse: [ self requireUpdate ]
]
