accessing
nodesAtRank: aRank
	^ self rankByNode associations select: [ :a | a value = aRank ] thenCollect: #key 