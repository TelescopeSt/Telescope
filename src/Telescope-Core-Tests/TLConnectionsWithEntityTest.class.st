Class {
	#name : #TLConnectionsWithEntityTest,
	#superclass : #TestCase,
	#instVars : [
		'group'
	],
	#category : #'Telescope-Core-Tests-Model'
}

{ #category : #running }
TLConnectionsWithEntityTest >> setUp [
	super setUp.
	group := TLEntitiesGroup new.
	TLVisualization new addDrawable: group.
	group 	addNodesFromEntities: (1 to: 4)
]

{ #category : #tests }
TLConnectionsWithEntityTest >> testConnectGroupFromANode [
	| connections  |
	connections := group connectFrom: TLSimpleNode new entity: 42.
	self assert: connections size equals: 4.
	
]

{ #category : #tests }
TLConnectionsWithEntityTest >> testConnectGroupToANode [
	| connections |
	connections := group connectTo: TLSimpleNode new entity: 42.
	self assert: connections size equals: 4
]

{ #category : #tests }
TLConnectionsWithEntityTest >> testConnectGroupWithSubgroupFromANode [
	| connections  |
	group > #subgroup addNodesFromEntities: (5 to: 8).
	connections := group connectFrom: TLSimpleNode new entity: 42..
	self assert: connections size equals: 8.
]

{ #category : #tests }
TLConnectionsWithEntityTest >> testConnectGroupWithSubgroupToANode [
	| connections  |
	group > #subgroup addNodesFromEntities: (5 to: 8).
	connections := group connectTo: TLSimpleNode new entity: 42..
	self assert: connections size equals: 8.
]

{ #category : #tests }
TLConnectionsWithEntityTest >> testConnectNodeFromAGroup [
	| connections  |
	connections := TLSimpleNode new connectFrom: group entity: 42..
	self assert: connections size equals: 4.
]

{ #category : #tests }
TLConnectionsWithEntityTest >> testConnectNodeFromAnotherNode [
	| connection  nodeA nodeB |
	nodeA := TLSimpleNode withEntity: $a.
	nodeB := TLSimpleNode withEntity: $b.
	connection := nodeB connectFrom: nodeA entity: 42.
	self assert: connection fromNode equals: nodeA.
	self assert: connection toNode equals: nodeB.
	
]

{ #category : #tests }
TLConnectionsWithEntityTest >> testConnectNodeToAGroup [
	| connections  |
	connections := TLSimpleNode new connectTo: group entity: 42.
	self assert: connections size equals: 4.
]

{ #category : #tests }
TLConnectionsWithEntityTest >> testConnectNodeToAnotherNode [
	| connection  nodeA nodeB |
	nodeA := TLSimpleNode withEntity: $a.
	nodeB := TLSimpleNode withEntity: $b.
	connection := nodeA connectTo: nodeB entity: 42.
	self assert: connection fromNode equals: nodeA.
	self assert: connection toNode equals: nodeB.
	
]
