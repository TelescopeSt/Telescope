building
buildNodeFromEntity: anEntity
	^ self nodeClass new entity: anEntity; addAllInteractions: self interactions