"
Description
------------------
A TLConnectAction is an action that will connect entities following a property.

The regular action will create connections and update the visualisation while the reverse action will remove those connections and update the visualisation. 

The user have the choice of the arrow direction via the #connectToOrigin property.

Public API and Key Messages
------------------

- #property: aBlock  			This block return the list of entities to connect to a node. (It should return the entities and not the nodes)
- #context: aCollection 		This collection contain the list of elements that might be linked to the node.  
- #connectToOrigin: aValuable 	ConnectToOrigin allow to know if the connection should be from the node or go to the node. It can be a boolean or a block taking the current node as parameter. If it return true, then the link will go to the node. 
- #connectionStyle: aSymbol 	Allow to customize the new connections.

 Examples
-----------------

	| visu |
	(visu := TLVisualization new)
		addNodesFromEntities: (1 to: 60);
		nodeLabel: #asString.
	visu
		addInteraction:
			((TLConnectAction property: [ :n | (1 to: 60) copyWithout: n ] context: visu allNodes) connectToOrigin: #even; yourself)
				onMouseOver.
	^ visu
	
	
	| visu |
	(visu := TLVisualization new)
		addNodesFromEntities: (1 to: 60);
		nodeLabel: #asString.
	visu
		addInteraction:
			(TLConnectAction property: [ :n | (1 to: 60) copyWithout: n ]  context: (visu allNodes first: 30))
				onMouseOver.
	^ visu
	
Internal Representation and Key Implementation Points.
-----------------

    Instance Variables
	connectToOrigin:			<aValuable> 		Used to know if the connection should go from the node with the interaction or should go to the node with the interaction.
	connectionsByNode:		<aDictionary>	Only used internaly, this dictionary keep for each node the connections it created in order to reverse the action.
	connectionStyle:			<aSymbol>		A style to add to the new connections
	context:					<aCollection>	A collection of nodes that can be connected. It should be view as the scope of the interaction.
	property:				<aValuable>		This block allow to know which nodes should be connected to the node with the interaction. 
"
Class {
	#name : #TLConnectAction,
	#superclass : #TLReversibleNodeAction,
	#instVars : [
		'connectionsByNode',
		'customizeWith',
		'property',
		'context',
		'connectToOrigin',
		'connectionStyle'
	],
	#category : #'Telescope-Core-Actions'
}

{ #category : #accessing }
TLConnectAction class >> property: aBlockOrProperty [
	^ self new
		property: aBlockOrProperty;
		yourself
]

{ #category : #accessing }
TLConnectAction class >> property: aBlockOrProperty context: aTLGroup [
	^ (self property: aBlockOrProperty)
		context: aTLGroup;
		yourself
]

{ #category : #accessing }
TLConnectAction >> connectToOrigin [
	^ connectToOrigin
]

{ #category : #accessing }
TLConnectAction >> connectToOrigin: anObject [
	connectToOrigin := anObject
]

{ #category : #accessing }
TLConnectAction >> connectionStyle [
	^ connectionStyle
]

{ #category : #accessing }
TLConnectAction >> connectionStyle: anObject [
	connectionStyle := anObject
]

{ #category : #accessing }
TLConnectAction >> connectionsByNode [
	^ connectionsByNode
]

{ #category : #accessing }
TLConnectAction >> connectionsByNode: anObject [
	connectionsByNode := anObject
]

{ #category : #accessing }
TLConnectAction >> context [
	^ context
]

{ #category : #accessing }
TLConnectAction >> context: anObject [
	context := anObject
]

{ #category : #accessing }
TLConnectAction >> customizeWith [
	^ customizeWith
]

{ #category : #accessing }
TLConnectAction >> customizeWith: anObject [
	customizeWith := anObject
]

{ #category : #initialization }
TLConnectAction >> initialize [
	super initialize.
	self connectionsByNode: Dictionary new.
	connectToOrigin := false
	
]

{ #category : #action }
TLConnectAction >> obtainContextFor: aConnectable [
	self flag: #Question. "Should we limit to visibles nodes?"
	^ self context value ifNil: [ aConnectable visualization obtain recursively nodes ]
]

{ #category : #action }
TLConnectAction >> obtainsNodesToConnectAt: aNode [
	| entitiesToConnect |
	entitiesToConnect := self obtain: self property on: aNode entity.
	^ (self obtainContextFor: aNode) select: [ :aPotentialNode | entitiesToConnect includes: aPotentialNode entity ]
]

{ #category : #accessing }
TLConnectAction >> property [
	^ property
]

{ #category : #accessing }
TLConnectAction >> property: anObject [
	property := anObject.
]

{ #category : #outsideRegistration }
TLConnectAction >> registerConnection: aTLConnection forNode: aTLNode [
	"Use me if you want to manually connect something and simulate this action has created it. Consequently, the revert will remove also this connection"

	(self connectionsByNode at: aTLNode) add: aTLConnection
]

{ #category : #action }
TLConnectAction >> regularActionOn: aNode [
	self connectionsByNode
		at: aNode
		put:
			((self obtain: self connectToOrigin on: aNode entity)
				ifFalse: [ aNode connectTo: (self obtainsNodesToConnectAt: aNode) ]
				ifTrue: [ (self obtainsNodesToConnectAt: aNode) connectTo: aNode ]).
	self customizeWith
		ifNotNil: [ (self connectionsByNode at: aNode)
				do: [ :c | self customizeWith cull: c ] ].
	self connectionStyle
		ifNotNil: [ (self connectionsByNode at: aNode)
				do: [ :c | c addStyle: self connectionStyle ] ]
]

{ #category : #action }
TLConnectAction >> reverseActionOn: aNode [
	(self connectionsByNode removeKey: aNode) do: #removed
]

{ #category : #testing }
TLConnectAction >> shouldTriggerReverseActionFor: aNode [
	^ self connectionsByNode at: aNode ifPresent: [ :c | true ] ifAbsent: [ false ]
]
