Class {
	#name : 'TLNodesByEntityTest',
	#superclass : 'TestCase',
	#instVars : [
		'visualization'
	],
	#category : 'Telescope-Core-Tests',
	#package : 'Telescope-Core-Tests'
}

{ #category : 'running' }
TLNodesByEntityTest >> setUp [
	"Nodes at the top, in a sub-group and in a composite node: the entity 3 is in two places, and the composite 20 contains the nodes 21 and 22"

	super setUp.
	visualization := TLVisualization new.
	visualization childrenProperty: [ :entity |
			entity = 20
				ifTrue: [ #( 21 22 ) ]
				ifFalse: [ #(  ) ] ].
	visualization nodeCreationStrategy beRecursive.
	visualization addNodesFromEntities: #( 1 2 3 20 ).
	visualization > #sub addNodesFromEntities: #( 3 4 5 )
]

{ #category : 'tests' }
TLNodesByEntityTest >> testConnectFollowingPropertyIndexesTheNodesOnce [
	"Looking for the targets of each node among all the nodes made the connections quadratic"

	| visualizationOfManyNodes time |
	visualizationOfManyNodes := TLVisualization fromEntities: (1 to: 3000).
	time := [
		        visualizationOfManyNodes connectFollowingProperty: [ :number |
				        {
					        (number + 1).
					        (number + 2) } ] ] timeToRun.
	self assert: time < 300 milliSeconds
]

{ #category : 'tests' }
TLNodesByEntityTest >> testConnectFollowingPropertyMakesTheSameConnectionsAsWithoutTheIndex [
	"The connections of each node, as Telescope made them before the index: the targets are in the order of the nodes in the visualization, and a single target is the first node found, the ones of the visualization before the ones of its sub-groups"

	visualization connectFollowingProperty: [ :entity |
			entity = 4
				ifTrue: [ 3 ]
				ifFalse: [ #( 3 21 ) ] ].
	self assert: (visualization allNodesRecursively collect: [ :node | node entity -> (node outgoingConnections collect: [ :connection | connection toNode entity ]) asArray ]) asArray equals: {
			(1 -> #( 3 21 3 )).
			(2 -> #( 3 21 3 )).
			(3 -> #( 3 21 3 )).
			(20 -> #( 3 21 3 )).
			(21 -> #(  )).
			(22 -> #(  )).
			(3 -> #( 3 21 3 )).
			(4 -> #( 3 )).
			(5 -> #( 3 21 3 )) }.
	self assert: (visualization > #sub nodeForEntity: 4) outgoingConnections first toNode identicalTo: (visualization nodeForEntity: 3)
]

{ #category : 'tests' }
TLNodesByEntityTest >> testIndexOfAnIndexIsTheIndex [

	| index |
	index := TLNodesByEntity on: visualization.
	self assert: index asNodesByEntity identicalTo: index
]

{ #category : 'tests' }
TLNodesByEntityTest >> testNodeForEntityIsTheOneOfTheGroup [

	#( 1 3 5 20 ) do: [ :entity | self assert: ((TLNodesByEntity on: visualization) nodeForEntity: entity) identicalTo: (visualization nodeForEntity: entity) ]
]

{ #category : 'tests' }
TLNodesByEntityTest >> testNodeForEntitySignalsNotFoundLikeTheGroup [

	self should: [ visualization nodeForEntity: 21 ] raise: NotFound.
	self should: [ (TLNodesByEntity on: visualization) nodeForEntity: 21 ] raise: NotFound.
	self should: [ (TLNodesByEntity on: visualization) nodeForEntity: 99 ] raise: NotFound
]

{ #category : 'tests' }
TLNodesByEntityTest >> testNodesForEntitiesAreTheOnesOfTheGroupInTheSameOrder [

	#( #( 1 ) #( 3 ) #( 5 3 1 ) #( 21 20 ) #( 22 21 20 3 ) #( 99 ) #( 1 1 ) #(  ) ) do: [ :entities |
			| expected actual |
			expected := visualization nodesForEntities: entities.
			actual := (TLNodesByEntity on: visualization) nodesForEntities: entities.
			self assert: actual asArray equals: expected asArray ]
]
