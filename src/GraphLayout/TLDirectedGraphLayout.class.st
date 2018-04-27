Class {
	#name : #TLDirectedGraphLayout,
	#superclass : #RTLayout,
	#category : 'GraphLayout-Core'
}

{ #category : #accessing }
TLDirectedGraphLayout >> adjacentPositionsForNode: aNode withRankNodes: aRankNodesCollection [
	^ aNode adjacentNodes collect: [ :anAdjacentNode | aRankNodesCollection indexOf: anAdjacentNode ] thenReject: [ :anIndex | anIndex = 0 ]
]

{ #category : #accessing }
TLDirectedGraphLayout >> calculateMedianValueForNode: aNode withRankNodes: aRankNodesCollection [
	"A technique for Drawing Directed Graph page 15"
	| adjacentNodesPositions m left right |
	adjacentNodesPositions := self adjacentPositionsForNode: aNode withRankNodes: aRankNodesCollection.
	adjacentNodesPositions ifEmpty: [ ^ -1 ].
	m := (adjacentNodesPositions size / 2) roundUpTo: 1.	
		
	"If the size is odd we return the central position"
	adjacentNodesPositions size odd
		ifTrue: [ ^ adjacentNodesPositions at: m ].
		
	adjacentNodesPositions size = 2
		ifTrue: [ ^ adjacentNodesPositions sum / 2 ].	
			
	"Here the size is even and >= 4"
	left := adjacentNodesPositions at: m - 1 - adjacentNodesPositions at: 0.
	right := adjacentNodesPositions last - adjacentNodesPositions at: m.
	^ ((adjacentNodesPositions at: m - 1) * right + ((adjacentNodesPositions at: m) * left)) / (right + left)
]

{ #category : #accessing }
TLDirectedGraphLayout >> computeCutValueHead: head tail: tail [
	^ ((head flatCollect: #outgoingConnections) select: [ :aConnection | tail includes: aConnection toNode ]) size
		- ((head flatCollect: #incomingConnections) select: [ :aConnection | tail includes: aConnection fromNode ]) size
]

{ #category : #accessing }
TLDirectedGraphLayout >> cutValuesForGraph: aGraph tightTree: tightTreeConnections [
	^ (tightTreeConnections
		collect: [ :aConnection | 
			|head tail|
			head := self getNodesFrom: aConnection fromNode ignoring: aConnection tightTree: tightTreeConnections.
			tail := self getNodesFrom: aConnection toNode ignoring: aConnection tightTree: tightTreeConnections.
			aConnection -> (self computeCutValueHead: head tail: tail) ]) asDictionary 
]

{ #category : #hook }
TLDirectedGraphLayout >> doExecute: elements [
	"Performs the layout"

	self shouldBeImplemented
]

{ #category : #hook }
TLDirectedGraphLayout >> drawGraph: elements [
	| rankedElements orderedElements positionByElement |
	rankedElements := self rankElements: elements.
	orderedElements := self orderElements: rankedElements.
	positionByElement := self positionForElement: orderedElements
]

{ #category : #accessing }
TLDirectedGraphLayout >> findAnEdgeToReplace: anEdgeWithANegativeCutValue tightTree: tightTree rankDictionary: rankDictionary [
	| possibleEdges |
	possibleEdges := (self
		obtainExternalIncomingConnectionsFor:
			(self getNodesFrom: anEdgeWithANegativeCutValue fromNode ignoring: anEdgeWithANegativeCutValue tightTree: tightTree))
		\ {anEdgeWithANegativeCutValue}.
	^ possibleEdges detectMin: [ :anEdge | self slackForConnection: anEdge rankDictionary: rankDictionary ]
]

{ #category : #accessing }
TLDirectedGraphLayout >> findNegativeCutValue: aCutValueDictionary [
	^ (aCutValueDictionary associations detect: [ :association | association value < 0 ]) key
]

{ #category : #accessing }
TLDirectedGraphLayout >> findRootNodesFromTightTree: aTightTree [
	| allFroms |
	allFroms := aTightTree collectAsSet: [ :aConnection | aConnection fromNode ].
	^ allFroms reject: [ :aNode | aTightTree anySatisfy: [ :aConnection | aConnection toNode = aNode ] ]
]

{ #category : #accessing }
TLDirectedGraphLayout >> getNodesFrom: aNode ignoring: cutEdge tightTree: tightTreeConnections [
	^ {aNode}
		,
			((aNode allConnections
				reject: [ :aConnection | aConnection = cutEdge or: [ (tightTreeConnections includes: aConnection) not ] ])
		flatCollect: [ :aConnection | 
			self
				getNodesFrom:
					(aConnection fromNode = aNode
						ifTrue: [ aConnection toNode ]
						ifFalse: [ aConnection fromNode ])
				ignoring: aConnection
				tightTree: tightTreeConnections ])
]

{ #category : #accessing }
TLDirectedGraphLayout >> initOrder: aRankedGraph [
	| resultNodes |
	resultNodes := OrderedCollection new.
	aRankedGraph do: [ :aRankCollection | resultNodes add: (aRankCollection flatCollect: [ :aNode | aNode outgoingConnections collect: #toNode ] as: OrderedCollection) ].
	^ resultNodes 
]

{ #category : #accessing }
TLDirectedGraphLayout >> initRank: aGraph [
	| rankDictionary toProceed |
	rankDictionary := Dictionary new.
	toProceed := aGraph nodes.
	[ toProceed notEmpty ]
		whileTrue: [ 
			| node |
			node := toProceed
				detect: [ :aNode | (aNode incomingConnections select: [ :aConnection | toProceed includes: aConnection fromNode ]) isEmpty ].
			rankDictionary
				at: node
				put: ((node incomingConnections max: [ :aConnection | rankDictionary at: aConnection fromNode ]) ifNil: [ -1 ]) + 1.
			toProceed remove: node ].
	^ rankDictionary
]

{ #category : #accessing }
TLDirectedGraphLayout >> obtainExternalConnectionsFor: tightTree [
	^ tightTree
		flatCollect: [ :aNode | 
			(aNode incomingConnections select: [ :aConnection | (tightTree includes: aConnection fromNode) not ])
				, (aNode outgoingConnections select: [ :aConnection | (tightTree includes: aConnection toNode) not ]) ]
]

{ #category : #accessing }
TLDirectedGraphLayout >> obtainExternalIncomingConnectionsFor: aCollectionOfNodes [
	^ aCollectionOfNodes
		flatCollect: [ :aNode | 
			(aNode incomingConnections select: [ :aConnection | (aCollectionOfNodes includes: aConnection fromNode) not ])]
]

{ #category : #accessing }
TLDirectedGraphLayout >> ordering: aRankedGraph [
	"input: aDictionary of Set of nodes by rank (the result of self rankTightTree: (self rankGraph: aGraph) )"

	"A technique for Drawing Directed Graph page 14"

	| order best |
	order := self initOrder: aRankedGraph.
	
	best := order.
	1 to: 24 do: [ :i | 
		self wmedian: order fromBottom: i odd.
		order := self transpose: order.
		(self crossing: order) < (self crossing: best)
			ifTrue: [ best = order ] ].
	^ best
]

{ #category : #accessing }
TLDirectedGraphLayout >> rankGraph: aGraph [
	| ranks tightTree cutValues |
	ranks := self initRank: aGraph.
	tightTree := self tightTreeFor: aGraph ranks: ranks.
	cutValues := self cutValuesForGraph: aGraph tightTree: tightTree.
	[ 
	[ 
	| edgeToRemove |
	edgeToRemove := self findNegativeCutValue: cutValues.
	tightTree add: (self findAnEdgeToReplace: edgeToRemove tightTree: tightTree rankDictionary: ranks).
	tightTree remove: edgeToRemove.
	cutValues := self cutValuesForGraph: aGraph tightTree: tightTree ] repeat ]
		on: NotFound
		do: [ 
			"no more negative cut value"
			 ].
	^ tightTree 
]

{ #category : #accessing }
TLDirectedGraphLayout >> rankTightTree: aTightTree [
"A technique for Drawing Directed Graph page 8 without normalize and balance"
	| rankDictionary remainingConnections currentRank |
	remainingConnections := aTightTree copy.
	rankDictionary := Dictionary new.
	rankDictionary at: 0 put: (self findRootNodesFromTightTree: aTightTree).
	currentRank := 0.
	[remainingConnections notEmpty]
		whileTrue: [ 
			|selected|
			selected := remainingConnections
				select: [ :aConnection | (rankDictionary at: currentRank) includes: aConnection fromNode ].
			currentRank := currentRank + 1.
			rankDictionary at: currentRank put: (selected collectAsSet: #toNode).
			remainingConnections removeAll: selected ].
		^ rankDictionary 
]

{ #category : #accessing }
TLDirectedGraphLayout >> slackForConnection: aConnection rankDictionary: aRankDictionary [
	^ ((aRankDictionary at: aConnection fromNode) - (aRankDictionary at: aConnection toNode)) abs
]

{ #category : #accessing }
TLDirectedGraphLayout >> sort: aCollectionOfNodesForARank followingMedianValueDictionary: medianValuesDictionary [
	^ aCollectionOfNodesForARank sorted: [ :a :b | (medianValuesDictionary at: a) < (medianValuesDictionary at: b) ]
]

{ #category : #accessing }
TLDirectedGraphLayout >> tightTreeFor: aGraph ranks: aRankDictionary [
	| tightTree tightTreeConnections |
	self flag: 'Does not return exactly the same tree than in paper'.
	tightTree := OrderedCollection new.
	tightTreeConnections := OrderedCollection new.
	tightTree add: aGraph nodes first.
	[ tightTree size < aGraph nodes size ]
		whileTrue: [ 
			| connection nodeToAdd delta |
			connection := (self obtainExternalConnectionsFor: tightTree)
				detectMin: [ :aConnection | self slackForConnection: aConnection rankDictionary: aRankDictionary ].
			delta := self slackForConnection: connection rankDictionary: aRankDictionary.
			(tightTree includes: connection fromNode)
				ifTrue: [ nodeToAdd := connection toNode ]
				ifFalse: [ 
					nodeToAdd := connection fromNode.
					delta := delta negated ].
			tightTree do: [ :aNode | aRankDictionary at: aNode put: (aRankDictionary at: aNode) + delta ].
			tightTree add: nodeToAdd.
			tightTreeConnections add: connection ].
	^ tightTreeConnections
]

{ #category : #accessing }
TLDirectedGraphLayout >> wmedian: order fromBottom: aBooleanForBottomOrTopTraversal [
	| medianValuesDictionary workingOrder |
	medianValuesDictionary := Dictionary new.
	workingOrder := aBooleanForBottomOrTopTraversal
		ifTrue: [ order ]
		ifFalse: [ order reverse ].
	^ workingOrder allButFirst
		collectWithIndex: [ :aCollectionOfNodesForARank :rankIndex | 
			aCollectionOfNodesForARank
				do: [ :aNode | medianValuesDictionary at: aNode put: (self calculateMedianValueForNode: aNode withRankNodes: (workingOrder at: rankIndex))	"Contrary to paper we are giving at rank index because the first element of collection is dropped by allButFirst" ].
			self sort: aCollectionOfNodesForARank followingMedianValueDictionary: medianValuesDictionary ]
]
