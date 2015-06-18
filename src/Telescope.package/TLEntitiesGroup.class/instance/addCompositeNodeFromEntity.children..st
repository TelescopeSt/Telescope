node - creation
addCompositeNodeFromEntity: aParentEntity children: aCollectionOfEntities 
	|composite|
	composite := (TLCompositeNode withEntity: aParentEntity).
	self addDrawable: composite.
	composite childrenGroup addNodesFromEntities: aCollectionOfEntities.
	^ composite