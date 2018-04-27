Class {
	#name : #TLTreeLayoutTest,
	#superclass : #BabyMockTestCase,
	#instVars : [
		'layout'
	],
	#category : 'Telescope-Tests-Layouts'
}

{ #category : #initialization }
TLTreeLayoutTest >> setUp [
	layout := TLTreeLayout new.
	layout useOutgoingLinks 
	
]

{ #category : #tests }
TLTreeLayoutTest >> testCyclicGraphAccepted [
	| nodes |
	nodes := (1 to: 3) collect: [ :i | context mock: 'child' , i asString ].
	nodes
		do: [ :node | 
			node can
				receive: #dimension;
				answers: 20 @ 20.
			node can
				receive: #isNode;
				answers: true.
			node can
				receive: #children;
				answers: {}.
			node can receive: #position:.
			node can
				receive: #occupyMaxSpace;
				answers: false.
			node can
				receive: #outgoingAdjacentNodes;
				answers: {(nodes after: node ifAbsent: [ nodes first ])} ].
	layout on: nodes
]

{ #category : #tests }
TLTreeLayoutTest >> testObtainTreeFromNodesWithOneNode [
	| node trees |
	node := context mock: #root.
	node can receive: #outgoingAdjacentNodes; answers: {}.
	trees := layout obtainTreesFromNodes: {node}.
	self assert: trees size equals: 1.
	self assert: (trees at: node) isEmpty
]

{ #category : #tests }
TLTreeLayoutTest >> testObtainTreeFromNodesWithThreeNodesInTwoBranches [
	| node trees root child |
	child := context mock: 'child'.
	child can
		receive: #outgoingAdjacentNodes;
		answers: {}.
	root := context mock: #root.
	root can
		receive: #outgoingAdjacentNodes;
		answers: {child}.
	node := context mock: 'node'.
	node can
		receive: #outgoingAdjacentNodes;
		answers: {}.
	trees := layout
		obtainTreesFromNodes:
			{root.
			node.
			child}.
	self assert: trees size equals: 2.
	self assert: (trees at: root) size equals: 1.
	self assert: ((trees at: root) at: child) isEmpty.
	self assert: (trees at: node) isEmpty
]

{ #category : #tests }
TLTreeLayoutTest >> testObtainTreeFromNodesWithTwoNodes [
	| node trees root |
	node := context mock: 'child'.
	node can
		receive: #outgoingAdjacentNodes;
		answers: {}.
	root := context mock: #root.
	root can
		receive: #outgoingAdjacentNodes;
		answers: {node}.
	trees := layout
		obtainTreesFromNodes:
			{root.
			node}.
	self assert: trees size equals: 1.
	self assert: (trees at: root) size equals: 1.
	self assert: ((trees at: root) at: node) isEmpty
]

{ #category : #tests }
TLTreeLayoutTest >> testObtainTreeFromNodesWithTwoNodesWithChildBeforeParent [
	| node trees root |
	node := context mock: 'child'.
	node can
		receive: #outgoingAdjacentNodes;
		answers: {}.
	root := context mock: #root.
	root can
		receive: #outgoingAdjacentNodes;
		answers: {node}.
	trees := layout
		obtainTreesFromNodes:
			{node.
			root}.
	self assert: trees size equals: 1.
	self assert: (trees at: root) size equals: 1.
	self assert: ((trees at: root) at: node) isEmpty
]

{ #category : #tests }
TLTreeLayoutTest >> testObtainYTable [
	| node root tree |
	layout levelGap: 5.
	node := context mock: 'child'.
	node can
		receive: #dimension;
		answers: 5 @ 10.
	node should
		receive: #isNode;
		answers: true.
	node can
		receive: #children;
		answers: {}.
	root := context mock: #root.
	root can
		receive: #dimension;
		answers: 10 @ 20.
	root should
		receive: #isNode;
		answers: true.
	root can
		receive: #children;
		answers: {}.
	tree := {(root -> {(node -> Dictionary new)} asDictionary)} asDictionary.
	self assert: (layout obtainYtableForTree: tree) equals: {0 . 25 . 40} asOrderedCollection
]

{ #category : #tests }
TLTreeLayoutTest >> testObtainYTableTwoChildren [
	| root tree child1 child2 |
	layout levelGap: 5.
	child1 := context mock: 'child1'.
	child1 can
		receive: #dimension;
		answers: 5 @ 10.
	child1 should
		receive: #isNode;
		answers: true.
	child1 can
		receive: #children;
		answers: {}.
	child2 := context mock: 'child2'.
	child2 can
		receive: #dimension;
		answers: 47 @ 35.
	child2 should
		receive: #isNode;
		answers: true.
	child2 can
		receive: #children;
		answers: {}.
	root := context mock: #root.
	root can
		receive: #dimension;
		answers: 13 @ 20.
	root should
		receive: #isNode;
		answers: true.
	root can
		receive: #children;
		answers: {}.
	tree := {(root
		->
			{(child1 -> Dictionary new).
			(child2 -> Dictionary new)} asDictionary)} asDictionary.
	self assert: (layout obtainYtableForTree: tree) equals: {0 . 25 . 65} asOrderedCollection
]
