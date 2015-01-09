connect
connectInsideGroupEntities: aCollectionOfEntities to: anotherCollectionOfEntities
	^ aCollectionOfEntities flatCollect: [ :fromEntity | anotherCollectionOfEntities collect: [ :toEntity | self connectInsideGroupEntity: fromEntity to: toEntity ]]