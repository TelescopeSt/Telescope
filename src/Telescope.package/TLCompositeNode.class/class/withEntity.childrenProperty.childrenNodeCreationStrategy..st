instance-creation
withEntity: anEntity childrenProperty: aChildrenProperty childrenNodeCreationStrategy: aChildrenNodeCreationStrategy
	^ (self
		withEntity: anEntity)
		childrenProperty: aChildrenProperty;
		childrenNodeCreationStrategy: aChildrenNodeCreationStrategy;
		yourself