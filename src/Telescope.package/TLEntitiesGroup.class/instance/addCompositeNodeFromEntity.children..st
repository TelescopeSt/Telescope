adding
addCompositeNodeFromEntity: aParentEntity children: aCollectionOfEntities 
	|composite|
	composite := (TLCompositeNode withEntity: aParentEntity).
	self addDrawable: composite.
	composite childrenGroup nodeCreationStrategy: TLNodeCreationStrategy default; addNodesFromEntities: aCollectionOfEntities.
	^ composite