enumerating
nodesDo: aBlock
	^ self telescopeEntities
		select: #isNode thenDo: aBlock