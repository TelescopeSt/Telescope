instance-creation
composite: aCompositeProperty withLayout: aLayout
	| strategy |
	strategy := self 
		composite: aCompositeProperty.
	strategy compositeChildrenLayout: aLayout.
	^ strategy