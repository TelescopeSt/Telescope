Class {
	#name : #TLConnectionsTest,
	#superclass : #TestCase,
	#instVars : [
		'group'
	],
	#category : #'Telescope-Core-Tests-Model'
}

{ #category : #running }
TLConnectionsTest >> setUp [
	| visualization |
	visualization := TLVisualization new.
	group := TLEntitiesGroup new.
	visualization addDrawable: group.
	group 	addNodesFromEntities: (1 to: 4)
]

{ #category : #tests }
TLConnectionsTest >> testConnectGroupFromANode [
	| connections  |
	connections := group connectFrom: TLSimpleNode new.
	self assert: connections size equals: 4.
]

{ #category : #tests }
TLConnectionsTest >> testConnectGroupToANode [
	| connections  |
	connections := group connectTo: TLSimpleNode new.
	self assert: connections size equals: 4.
]

{ #category : #tests }
TLConnectionsTest >> testConnectGroupWithSubgroupFromANode [
	| connections  |
	group > #subgroup addNodesFromEntities: (5 to: 8).
	connections := group connectFrom: TLSimpleNode new.
	self assert: connections size equals: 8.
]

{ #category : #tests }
TLConnectionsTest >> testConnectGroupWithSubgroupToANode [
	| connections  |
	group > #subgroup addNodesFromEntities: (5 to: 8).
	connections := group connectTo: TLSimpleNode new.
	self assert: connections size equals: 8.
]

{ #category : #tests }
TLConnectionsTest >> testConnectIfNotNodeToAGroup [
	| connections node |
	node := TLSimpleNode new.
	connections := node connectIfNotTo: group.
	self assert: connections size equals: 4.
	self assert: connections asArray equals: (node connectIfNotTo: group) asArray.
	self assert: node outgoingConnections size equals: 4
	
]

{ #category : #tests }
TLConnectionsTest >> testConnectIfNotNodeToAnotherNode [
	| connection nodeA nodeB |
	nodeA := TLSimpleNode withEntity: $a.
	nodeB := TLSimpleNode withEntity: $b.
	connection := nodeA connectIfNotTo: nodeB.
	self assert: connection fromNode equals: nodeA.
	self assert: connection toNode equals: nodeB.
	self assert: connection equals: (nodeA connectIfNotTo: nodeB).
	self assert: nodeA outgoingConnections size equals: 1
]

{ #category : #tests }
TLConnectionsTest >> testConnectNodeFromAGroup [
	| connections  |
	connections := TLSimpleNode new connectFrom: group.
	self assert: connections size equals: 4.
]

{ #category : #tests }
TLConnectionsTest >> testConnectNodeFromAnotherNode [
	| connection  nodeA nodeB |
	nodeA := TLSimpleNode withEntity: $a.
	nodeB := TLSimpleNode withEntity: $b.
	connection := nodeB connectFrom: nodeA.
	self assert: connection fromNode equals: nodeA.
	self assert: connection toNode equals: nodeB.
	
]

{ #category : #tests }
TLConnectionsTest >> testConnectNodeToAGroup [
	| connections  |
	connections := TLSimpleNode new connectTo: group.
	self assert: connections size equals: 4.
]

{ #category : #tests }
TLConnectionsTest >> testConnectNodeToAnotherNode [
	| connection  nodeA nodeB |
	nodeA := TLSimpleNode withEntity: $a.
	nodeB := TLSimpleNode withEntity: $b.
	connection := nodeA connectTo: nodeB.
	self assert: connection fromNode equals: nodeA.
	self assert: connection toNode equals: nodeB.
	
]

{ #category : #tests }
TLConnectionsTest >> testConnectThroughWithCollection [
	| connections connection |
	connections := group connectThrough: [ :each | {each + 1} ] to: [ :each | each + 2 ].
	self assert: connections size equals: 1.
	connection := connections first.
	self assert: connection fromNode entity equals: 1.
	self assert: connection toNode entity equals: 4.
	self assert: connection entity equals: 2.
]

{ #category : #tests }
TLConnectionsTest >> testConnectThroughWithNonExistingEntity [
	| connections connection |
	connections := group connectThrough: [ :each | {each + 1 . each + 16} ] to: [ :each | each + 2 ].
	self assert: connections size equals: 1.
	connection := connections first.
	self assert: connection fromNode entity equals: 1.
	self assert: connection toNode entity equals: 4.
	self assert: connection entity equals: 2.
]
