adding
addNodeFromEntity: anEntity withStrategy: aTLNodeCreationStrategy
	| newNode |
	newNode := aTLNodeCreationStrategy createNodeFromEntity: anEntity.
	self addDrawable: newNode.
	^ newNode