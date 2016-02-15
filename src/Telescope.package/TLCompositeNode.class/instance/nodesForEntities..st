enumeration
nodesForEntities: aCollectionOfEntities
	^ (aCollectionOfEntities includes: self entity)
		ifTrue: [ {self} ]
		ifFalse: [ self childrenGroup nodesForEntities: aCollectionOfEntities ]