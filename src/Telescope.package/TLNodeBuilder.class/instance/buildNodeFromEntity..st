building
buildNodeFromEntity: anEntity
	^ self nodeClass new shape: (self shapeBuilder copy); entity: anEntity; addAllInteractions: self interactions