Class {
	#name : #TLDirectedGraphLayoutTest,
	#superclass : #TestCase,
	#instVars : [
		'layout'
	],
	#category : 'GraphLayout-Tests'
}

{ #category : #'as yet unclassified' }
TLDirectedGraphLayoutTest >> createTelescopeGraphFrom: aCollectionOfAssociations [
	| nodesGroup |
	nodesGroup := TLEntitiesGroup new.
	nodesGroup nodeBuilder: (TLNodeBuilder new).
	nodesGroup edgeBuilder: (TLEdgeBuilder new).
	nodesGroup addAbsentNodesInVisualizationFromEntities: (aCollectionOfAssociations collect: #key) asSet.
	nodesGroup addAbsentNodesInVisualizationFromEntities: (aCollectionOfAssociations collect: #value) asSet.
	aCollectionOfAssociations
		do: [ :assoc | (nodesGroup nodeForEntity: assoc key) connectTo: (nodesGroup nodeForEntity: assoc value) ].
	^ nodesGroup
]

{ #category : #'as yet unclassified' }
TLDirectedGraphLayoutTest >> graph1 [
	^ {($a -> $b).
	($a -> $e).
	($a -> $f).
	($b -> $c).
	($c -> $d).
	($d -> $h).
	($e -> $g).
	($f -> $g).
	($g -> $h)}
]

{ #category : #'as yet unclassified' }
TLDirectedGraphLayoutTest >> setUp [
	layout := TLDirectedGraphLayout new
]

{ #category : #'as yet unclassified' }
TLDirectedGraphLayoutTest >> testAdjacentPositionsForNodeWithRankNodes [

	| graph cNode |
	graph := (self createTelescopeGraphFrom: self graph1).
	cNode := graph nodeForEntity: $c.
	self assert: (layout adjacentPositionsForNode: cNode withRankNodes: (graph nodesForEntities: #($e $f $b))) asArray equals: #(3)
]

{ #category : #'as yet unclassified' }
TLDirectedGraphLayoutTest >> testComputeCutValueHeadTailForCinGraph1 [
	| graph |
	graph := self createTelescopeGraphFrom: self graph1.
	self
		assert:
			(layout computeCutValueHead: (graph nodesForEntities: #($a $b $c)) tail: (graph nodesForEntities: #($d $e $f $g $h)))
		equals: 3.
	self
		assert:
			(layout computeCutValueHead: (graph nodesForEntities: #($f)) tail: (graph nodesForEntities: #($a $b $c $d $e $g $h)))
		equals: 0.
	self
		assert:
			(layout computeCutValueHead: (graph nodesForEntities: #($e $f $g)) tail: (graph nodesForEntities: #($a $b $c $d $h)))
		equals: -1
]

{ #category : #'as yet unclassified' }
TLDirectedGraphLayoutTest >> testFindAnEdgeToReplaceTightTreeRankDictionary [
	| graph tightTree cutValuesDictionary edgeWithNegativeCutValue rankDictionary replacementEdge |
	graph := self createTelescopeGraphFrom: self graph1.
	tightTree := self tightTreeForGraph1: graph.
	rankDictionary := layout initRank: graph.
	cutValuesDictionary := layout cutValuesForGraph: graph tightTree: tightTree.
	edgeWithNegativeCutValue := layout findNegativeCutValue: cutValuesDictionary.
	replacementEdge := (layout findAnEdgeToReplace: edgeWithNegativeCutValue tightTree: tightTree rankDictionary: rankDictionary).
	self assert: replacementEdge fromNode entity equals: $a.
	self assert: replacementEdge toNode entity equals: $e
]

{ #category : #'as yet unclassified' }
TLDirectedGraphLayoutTest >> testFindNegativeCutValue [
	| graph tightTree cutValuesDictionary edgeWithNegativeCutValue |
	graph := self createTelescopeGraphFrom: self graph1.
	tightTree := self tightTreeForGraph1: graph.
	cutValuesDictionary := layout cutValuesForGraph: graph tightTree: tightTree.
	edgeWithNegativeCutValue := layout findNegativeCutValue: cutValuesDictionary.
	self assert: edgeWithNegativeCutValue fromNode entity equals: $g.
	self assert: edgeWithNegativeCutValue toNode entity equals: $h
]

{ #category : #'as yet unclassified' }
TLDirectedGraphLayoutTest >> testFindRootNodesFromTightTreeAfterRanking [
	| graph1 |
	graph1 := (self createTelescopeGraphFrom: self graph1).
	self assert: (layout findRootNodesFromTightTree: (layout rankGraph: graph1)) equals: {graph1 nodeForEntity: $a} asSet
]

{ #category : #'as yet unclassified' }
TLDirectedGraphLayoutTest >> testInitRank [
	| rankDictionary graph |
	graph := self createTelescopeGraphFrom: self graph1.
	rankDictionary := layout initRank: graph.
	self assert: (rankDictionary at: (graph nodeForEntity: $a)) equals: 0.
	self assert: (rankDictionary at: (graph nodeForEntity: $b)) equals: 1.
	self assert: (rankDictionary at: (graph nodeForEntity: $c)) equals: 2.
	self assert: (rankDictionary at: (graph nodeForEntity: $d)) equals: 3.
	self assert: (rankDictionary at: (graph nodeForEntity: $e)) equals: 1.
	self assert: (rankDictionary at: (graph nodeForEntity: $f)) equals: 1.
	self assert: (rankDictionary at: (graph nodeForEntity: $g)) equals: 2.
	self assert: (rankDictionary at: (graph nodeForEntity: $h)) equals: 4
]

{ #category : #'as yet unclassified' }
TLDirectedGraphLayoutTest >> testManyTimesRankTightTree [
	| graph1 result result2 |
	result := nil.
	
	100 timesRepeat: [ 
	graph1 := (self createTelescopeGraphFrom: self graph1).
	result2 := (layout rankTightTree: (layout rankGraph: graph1)).
	result ifNotNil: [self assert: result equals: result2].
	result := result2.]
]

{ #category : #'as yet unclassified' }
TLDirectedGraphLayoutTest >> testOrdering [
	| graph1 |
	graph1 := (self createTelescopeGraphFrom: self graph1).
	layout ordering: (layout rankTightTree: (layout rankGraph: graph1) ) 
]

{ #category : #'as yet unclassified' }
TLDirectedGraphLayoutTest >> testRankGraph1 [
	(layout rankGraph: (self createTelescopeGraphFrom: self graph1) ) inspect.
]

{ #category : #'as yet unclassified' }
TLDirectedGraphLayoutTest >> testRankTightTree [
	| graph1 |
	graph1 := (self createTelescopeGraphFrom: self graph1).
	(layout rankTightTree: (layout rankGraph: graph1) inspect) inspect
]

{ #category : #'as yet unclassified' }
TLDirectedGraphLayoutTest >> testTightTree [
	| rankDictionary graph tightTreeConnections|
	graph := self createTelescopeGraphFrom: self graph1.
	rankDictionary := layout initRank: graph.
	tightTreeConnections:= (layout tightTreeFor: graph ranks: rankDictionary).
	self assert: tightTreeConnections size equals: graph nodes size - 1
]

{ #category : #'as yet unclassified' }
TLDirectedGraphLayoutTest >> testcutValuesForGraphTightTree [
	|  graph tightTree  |
	graph := self createTelescopeGraphFrom: self graph1.
	tightTree := (self tightTreeForGraph1: graph).
	layout cutValuesForGraph: graph tightTree: tightTree
]

{ #category : #'as yet unclassified' }
TLDirectedGraphLayoutTest >> testgetNodesFromIgnoringTightTree [
	|  graph tightTree nodes |
	graph := self createTelescopeGraphFrom: self graph1.
	tightTree := (self tightTreeForGraph1: graph).
	nodes := layout getNodesFrom: (graph nodeForEntity: $c) ignoring: (graph nodeForEntity: $c) outgoingConnections first tightTree: tightTree.
	self assert: (nodes collect:  #entity as: Set) equals: #($a $b $c) asSet.
	nodes := layout getNodesFrom: (graph nodeForEntity: $d) ignoring: (graph nodeForEntity: $c) outgoingConnections first tightTree: tightTree.
	self assert: (nodes collect:  #entity as: Set) equals: #($d $e $f $g $h) asSet.
	
]

{ #category : #'as yet unclassified' }
TLDirectedGraphLayoutTest >> tightTreeForGraph1: theGraph1 [

	| tightTreeConnections |
	tightTreeConnections := {($a -> $b).
	($b -> $c).
	($c -> $d).
	($d -> $h).
	($e -> $g).
	($f -> $g).
	($g -> $h)}.
	^ tightTreeConnections
		collect: [ :aLink | 
			(theGraph1 nodeForEntity: aLink key) outgoingConnections
				detect: [ :aConnection | aConnection toNode = (theGraph1 nodeForEntity: aLink value) ] ]
]
