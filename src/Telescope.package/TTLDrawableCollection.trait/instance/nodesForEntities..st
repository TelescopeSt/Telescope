accessing
nodesForEntities: aCollectionOfEntities
	^ self flatCollect: [ :aTelescopeEntity | aTelescopeEntity nodesForEntities: aCollectionOfEntities ]