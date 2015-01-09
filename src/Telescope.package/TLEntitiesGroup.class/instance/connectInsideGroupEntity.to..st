connect
connectInsideGroupEntity: anEntity to: anotherEntity
	^ (self nodeForEntity: anEntity) connectTo: (self nodeForEntity: anotherEntity)