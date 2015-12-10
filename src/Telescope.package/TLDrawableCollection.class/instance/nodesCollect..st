enumerating
nodesCollect: aBlock
	^ self
		select: #isNode thenCollect: aBlock