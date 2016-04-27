children-creation
addChildNodeFromEntity: anEntity 
	self requireUpdateAndLayoutApplication.
	^ self childrenGroup addNodeFromEntity: anEntity withStrategy: TLNodeCreationStrategy default.