instance creation
fromEntities: aCollection
	^ self new
		addNodesFromEntities: aCollection;
		yourself