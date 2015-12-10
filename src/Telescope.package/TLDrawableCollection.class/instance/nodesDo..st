enumerating
nodesDo: aBlock
	^ self
		select: #isNode thenDo: aBlock