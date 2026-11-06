"
I find the nodes which are in a cycle of dependencies: the nodes of a strongly connected component of more than one node (Tarjan algorithm). A node which depends only on itself is not in a cycle. I am given the nodes and a block which answers the nodes a node depends on. The dependencies to something which is not one of the nodes are ignored.
"
Class {
	#name : 'TLCycleDetector',
	#superclass : 'Object',
	#instVars : [
		'nodes',
		'successorsBlock',
		'indexes',
		'lowLinks',
		'stack',
		'cyclicNodes'
	],
	#category : 'Telescope-VisualizationTemplates',
	#package : 'Telescope-VisualizationTemplates'
}

{ #category : 'instance creation' }
TLCycleDetector class >> nodes: aCollection successors: aBlock [
	"The block answers the nodes which a node depends on"

	^ self new setNodes: aCollection successors: aBlock; run; yourself
]

{ #category : 'accessing' }
TLCycleDetector >> cyclicNodes [
	"The nodes which are in a cycle"

	^ cyclicNodes
]

{ #category : 'testing' }
TLCycleDetector >> isInCycle: aNode [
	^ cyclicNodes includes: aNode
]

{ #category : 'running' }
TLCycleDetector >> run [
	nodes do: [ :node | indexes at: node ifAbsent: [ self visit: node ] ]
]

{ #category : 'initialization' }
TLCycleDetector >> setNodes: aCollection successors: aBlock [
	nodes := aCollection asSet.
	successorsBlock := aBlock.
	indexes := Dictionary new.
	lowLinks := Dictionary new.
	stack := OrderedCollection new.
	cyclicNodes := Set new
]

{ #category : 'running' }
TLCycleDetector >> successorsOf: node [
	^ (successorsBlock value: node) select: [ :successor | nodes includes: successor ]
]

{ #category : 'running' }
TLCycleDetector >> visit: node [
	| component |
	indexes at: node put: indexes size + 1.
	lowLinks at: node put: (indexes at: node).
	stack addLast: node.
	(self successorsOf: node) do: [ :successor |
		indexes
			at: successor
			ifPresent: [ :successorIndex | (stack includes: successor) ifTrue: [ lowLinks at: node put: ((lowLinks at: node) min: successorIndex) ] ]
			ifAbsent: [
				self visit: successor.
				lowLinks at: node put: ((lowLinks at: node) min: (lowLinks at: successor)) ] ].
	(lowLinks at: node) = (indexes at: node) ifFalse: [ ^ self ].
	component := OrderedCollection new.
	[ component add: stack removeLast. component last = node ] whileFalse.
	component size > 1 ifTrue: [ cyclicNodes addAll: component ]
]
