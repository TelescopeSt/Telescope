Class {
	#name : #TLTreeLayoutTest,
	#superclass : #TestCase,
	#instVars : [
		'layout'
	],
	#category : #'Telescope-Layouts-Tests'
}

{ #category : #running }
TLTreeLayoutTest >> setUp [
	super setUp.
	layout := TLTreeLayout new.
	layout useOutgoingLinks 
	
]

{ #category : #tests }
TLTreeLayoutTest >> testCyclicGraphAccepted [
	| nodes |
	nodes := (1 to: 3) collect: [ :i | Mock named: 'Node' , i asString ].
	nodes
		do: [ :node | 
			node stub dimension willReturn: 20 @ 20.
			node stub isNode willReturn: true.
			node stub children willReturn: {}.
			node stub occupyMaxSpace willReturn: false.
			node stub outgoingAdjacentNodes willReturn: {(nodes after: node ifAbsent: [ nodes first ])} ].

	layout on: nodes
]

{ #category : #tests }
TLTreeLayoutTest >> testObtainTreeFromNodesWithOneNode [
	| node trees |
	node := Mock named: 'root'.
	node stub outgoingAdjacentNodes willReturn: {}.
	trees := layout obtainTreesFromNodes: {node}.
	self assert: trees size equals: 1.
	self assert: (trees at: node) isEmpty
]

{ #category : #tests }
TLTreeLayoutTest >> testObtainTreeFromNodesWithThreeNodesInTwoBranches [
	| node trees root child |
	child := Mock named: 'child'.
	child stub outgoingAdjacentNodes willReturn: {}.
	root := Mock named: 'root'.
	root stub outgoingAdjacentNodes willReturn: {child}.
	node := Mock named: 'node'.
	node stub outgoingAdjacentNodes willReturn: {}.
	trees := layout obtainTreesFromNodes: {root . node . child}.
	self assert: trees size equals: 2.
	self assert: (trees at: root) size equals: 1.
	self assert: ((trees at: root) at: child) isEmpty.
	self assert: (trees at: node) isEmpty
]

{ #category : #tests }
TLTreeLayoutTest >> testObtainTreeFromNodesWithTwoNodes [
	| node trees root |
	node := Mock named: 'child'.
	node stub outgoingAdjacentNodes willReturn: {}.
	root := Mock named: 'root'.
	root stub outgoingAdjacentNodes willReturn: {node}.
	trees := layout obtainTreesFromNodes: {root . node}.
	self assert: trees size equals: 1.
	self assert: (trees at: root) size equals: 1.
	self assert: ((trees at: root) at: node) isEmpty
]

{ #category : #tests }
TLTreeLayoutTest >> testObtainTreeFromNodesWithTwoNodesWithChildBeforeParent [
	| node trees root |
	node := Mock named: 'child'.
	node stub outgoingAdjacentNodes willReturn: {}.
	root := Mock named: 'root'.
	root stub outgoingAdjacentNodes willReturn: {node}.
	trees := layout obtainTreesFromNodes: {node . root}.
	self assert: trees size equals: 1.
	self assert: (trees at: root) size equals: 1.
	self assert: ((trees at: root) at: node) isEmpty
]

{ #category : #tests }
TLTreeLayoutTest >> testObtainYTable [
	| node root tree |
	layout levelGap: 5.
	node := Mock named: 'child'.
	node stub dimension willReturn: 5 @ 10.
	node stub isNode willReturn: true.
	node stub children willReturn: {}.
	root := Mock named: 'root'.
	root stub dimension willReturn: 10 @ 20.
	root stub isNode willReturn: true.
	root stub children willReturn: {}.
	tree := {(root -> {(node -> Dictionary new)} asDictionary)} asDictionary.
	self assert: (layout obtainYtableForTree: tree) equals: {0 . 25 . 40} asOrderedCollection.

	{root . node} do: [ :n | n should receive isNode ]
]

{ #category : #tests }
TLTreeLayoutTest >> testObtainYTableTwoChildren [
	| root tree child1 child2 |
	layout levelGap: 5.
	child1 := Mock named: 'child1'.
	child1 stub dimension willReturn: 5 @ 10.
	child1 stub isNode willReturn: true.
	child1 stub children willReturn: {}.
	child2 := Mock named: 'child2'.
	child2 stub dimension willReturn: 47 @ 35.
	child2 stub isNode willReturn: true.
	child2 stub children willReturn: {}.
	root := Mock named: 'root'.
	root stub dimension willReturn: 13 @ 20.
	root stub isNode willReturn: true.
	root stub children willReturn: {}.

	tree := {(root -> {(child1 -> Dictionary new) . (child2 -> Dictionary new)} asDictionary)} asDictionary.
	self assert: (layout obtainYtableForTree: tree) equals: {0 . 25 . 65} asOrderedCollection.
	
	{ root. child1 . child2 } do: [ :node | node should receive isNode ]
]
