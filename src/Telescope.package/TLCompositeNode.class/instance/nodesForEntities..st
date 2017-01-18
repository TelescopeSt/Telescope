enumeration
nodesForEntities: aCollectionOfEntities
	| result |
	result := self childrenGroup nodesForEntities: aCollectionOfEntities.
	(aCollectionOfEntities includes: self entity)
		ifTrue: [ result add: self ].
	^ result