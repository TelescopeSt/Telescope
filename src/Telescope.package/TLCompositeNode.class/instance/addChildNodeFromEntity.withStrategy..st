children-creation
addChildNodeFromEntity: anEntity withStrategy: aNodeCreationStrategy
	self requireUpdateAndLayoutApplication.
	^ self childrenGroup addNodeFromEntity: anEntity withStrategy: aNodeCreationStrategy