instance-creation
recursiveComposite: aCompositeProperty withLayout: aLayout
	^ (self composite: aCompositeProperty withLayout: aLayout)
		beRecursive;
		yourself