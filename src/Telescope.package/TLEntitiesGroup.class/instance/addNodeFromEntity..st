adding
addNodeFromEntity: anEntity
	| newNode |
	newNode := self nodeBuilder buildNodeFromEntity: anEntity.
	self addDrawable: newNode.
	^ newNode