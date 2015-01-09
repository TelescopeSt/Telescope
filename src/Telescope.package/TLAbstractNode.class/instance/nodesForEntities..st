as yet unclassified
nodesForEntities: aCollectionOfEntities
	^ (aCollectionOfEntities includes: self entity)
		ifTrue: [ {self} ]
		ifFalse: [ #() ]