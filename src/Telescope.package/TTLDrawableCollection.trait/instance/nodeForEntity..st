nodes-entity
nodeForEntity: anEntity
	^ self nodeForEntity: anEntity ifAbsent: [ NotFound signal ]