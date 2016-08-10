accessing
entity: anEntity
	super entity: anEntity.
	self areChildrenGenerated
		ifTrue: [ self childrenGroup removeAll ]