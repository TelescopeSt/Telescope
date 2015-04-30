accessing
wmedian: order fromBottom: aBooleanForBottomOrTopTraversal
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