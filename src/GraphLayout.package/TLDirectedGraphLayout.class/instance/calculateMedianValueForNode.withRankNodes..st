accessing
calculateMedianValueForNode: aNode withRankNodes: aRankNodesCollection
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