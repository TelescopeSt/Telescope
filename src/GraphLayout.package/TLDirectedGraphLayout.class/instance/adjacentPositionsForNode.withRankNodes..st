accessing
adjacentPositionsForNode: aNode withRankNodes: aRankNodesCollection
	^ aNode adjacentNodes collect: [ :anAdjacentNode | aRankNodesCollection indexOf: anAdjacentNode ] thenReject: [ :anIndex | anIndex = 0 ]