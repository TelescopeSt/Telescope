"
A TLExpandCollapseChildNodeAction is an action that will expand the Node using a property to create children. By default all new nodes will be added in node's parent group but you can specify the destination group.

Instance Variables
	nodeState:		<Object>
	parentToChildren:		<Object>
	property:		<Object>

nodeState
	- xxxxx

parentToChildren
	- xxxxx

property
	- xxxxx

"
Class {
	#name : #TLExpandCollapseNodesAction,
	#superclass : #TLReversibleNodeAction,
	#instVars : [
		'parentToChildren',
		'property',
		'destinationGroup',
		'expandToOrigin'
	],
	#category : 'Telescope-Actions'
}

{ #category : #accessing }
TLExpandCollapseNodesAction class >> property: aBlockOrProperty [
	^ self new
		property: aBlockOrProperty;
		yourself
]

{ #category : #accessing }
TLExpandCollapseNodesAction class >> property: aBlockOrProperty destinationGroup: aTLGroup [
	^ (self property: aBlockOrProperty)
		destinationGroup: aTLGroup;
		yourself
]

{ #category : #action }
TLExpandCollapseNodesAction >> connectNewNodes: newNodes toExistingOnesInVisu: aVisualization [
	newNodes
		do: [ :aNode | aNode connectIfNotTo: (aVisualization nodesForEntities: (self obtain: self property on: aNode entity)) ]
]

{ #category : #action }
TLExpandCollapseNodesAction >> createNodeForEntity: aChild inGroup: aGroup [
	^ aGroup addNodeFromEntity: aChild
]

{ #category : #accessing }
TLExpandCollapseNodesAction >> destinationGroup [
	^ destinationGroup
]

{ #category : #accessing }
TLExpandCollapseNodesAction >> destinationGroup: anObject [
	destinationGroup := anObject
]

{ #category : #destination }
TLExpandCollapseNodesAction >> destinationGroupFor: entity byDefault: aGroup [
	^ self destinationGroup ifNotNil: [ self obtain: self destinationGroup on: entity ] ifNil: [ aGroup ]
]

{ #category : #action }
TLExpandCollapseNodesAction >> expandIdentifier [
	^ #expanded , self property hash asString
]

{ #category : #accessing }
TLExpandCollapseNodesAction >> expandToOrigin [
	"This property will reverse the connection created from new nodes to origin instead of origin to new nodes"
	expandToOrigin := true
]

{ #category : #initialization }
TLExpandCollapseNodesAction >> initialize [
	super initialize.
	self parentToChildren: Dictionary new.
	expandToOrigin := false
	
]

{ #category : #action }
TLExpandCollapseNodesAction >> obtainNodesWhereNew: newNodes fromEntities: children withOriginNode: aNode [
	^ children
		collect: [ :aChild | 
			(self destinationGroupFor: aChild byDefault: aNode parent)
				nodeForEntity: aChild
				ifAbsent: [ newNodes add: (self createNodeForEntity: aChild inGroup: (self destinationGroupFor: aChild byDefault: aNode parent)) ] ]
		as: TLDrawableCollection
]

{ #category : #accessing }
TLExpandCollapseNodesAction >> parentToChildren [
	^ parentToChildren
]

{ #category : #accessing }
TLExpandCollapseNodesAction >> parentToChildren: anObject [
	parentToChildren := anObject
]

{ #category : #accessing }
TLExpandCollapseNodesAction >> property [
	^ property
]

{ #category : #accessing }
TLExpandCollapseNodesAction >> property: anObject [
	property := anObject
]

{ #category : #action }
TLExpandCollapseNodesAction >> regularActionOn: aNode [
	| newNodes targetNodes children |
	(children := self obtain: self property on: aNode entity) isCollection
		ifFalse: [ TLWrongUsedFunctionalityException signal: 'The property of the ExpandCollapseNodesAction should be a collection.' ].
	children
		ifNotEmpty: [ 
			newNodes := TLDrawableCollection new.
			targetNodes := self obtainNodesWhereNew: newNodes fromEntities: children withOriginNode: aNode.
			self parentToChildren at: aNode put: newNodes.
			expandToOrigin
				ifFalse: [ aNode connectIfNotToAll: targetNodes ]
				ifTrue: [ targetNodes connectIfNotTo: aNode ].
			self connectNewNodes: newNodes toExistingOnesInVisu: aNode visualization.
			aNode state at: self expandIdentifier put: true ]
]

{ #category : #action }
TLExpandCollapseNodesAction >> reverseActionOn: aNode [
	[ 
	(self parentToChildren at: aNode)
		do: [ :node | 
			(node state at: self expandIdentifier ifAbsent: [ false ])
				ifTrue: [ self reverseActionOn: node ].
			node parent remove: node ].
	self parentToChildren removeKey: aNode.
	aNode state at: self expandIdentifier put: false ]
		on: KeyNotFound
		do: [ self flag: 'Should not happen but must investigate on it' ]
]

{ #category : #testing }
TLExpandCollapseNodesAction >> shouldTriggerReverseActionFor: aNode [
	^ aNode state at: self expandIdentifier ifAbsent: [ false ]
]
