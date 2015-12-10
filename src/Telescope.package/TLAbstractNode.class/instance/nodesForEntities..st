accessing
nodesForEntities: aCollectionOfEntities
	^ (aCollectionOfEntities includes: self entity)
		ifTrue: [ {self} ]
		ifFalse: [ #() ]