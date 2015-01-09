connect
connectInsideGroupEntity: anEntity toEntity: anotherEntity FromAnotherGroup: anotherGroup
	^ (self nodeForEntity: anEntity) connectTo: (anotherGroup nodeForEntity: anotherEntity)