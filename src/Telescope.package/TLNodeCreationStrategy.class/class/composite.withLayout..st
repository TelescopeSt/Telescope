instance-creation
composite: aCompositeProperty withLayout: aLayout
	^ (self composite: aCompositeProperty)
		compositeChildrenLayout: aLayout;
		yourself