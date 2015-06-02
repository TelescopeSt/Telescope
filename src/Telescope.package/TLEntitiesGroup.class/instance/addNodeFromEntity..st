adding
addNodeFromEntity: anEntity
	| newNode |
	newNode := self buildNodeFromEntity: anEntity.
	self addDrawable: newNode.
	^ newNode