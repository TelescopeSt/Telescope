accessing
nodesForEntitiesIgnoringNotFound: aCollectionOfEntities
	^ (self flatCollect: [ :aTelescopeEntity | [aTelescopeEntity nodesForEntities: aCollectionOfEntities] on: NotFound do: [ nil ] ]) select: #notNil