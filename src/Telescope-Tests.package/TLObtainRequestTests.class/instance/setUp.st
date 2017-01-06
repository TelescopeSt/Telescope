tests
setUp
	simple := TLSimpleNode new.
	composite := TLCompositeNode new.
	group := TLEntitiesGroup new.
	compositeChildrenNode := TLSimpleNode new
		parent: composite;
		yourself.
	compositeChildrenGroup := TLEntitiesGroup new
		parent: composite;
		yourself.
	groupSimpleNode := TLSimpleNode new
		parent: group;
		yourself.
	groupChildrenGroup := TLEntitiesGroup new
		parent: group;
		yourself.
	collection := TLDrawableCollection
		withAll:
			{simple.
			composite.
			group}