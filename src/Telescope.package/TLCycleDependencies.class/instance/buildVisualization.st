building
buildVisualization

	self title: 'Dependencies (cycles)'.
	self > #packages
		addNodesFromEntities: self packageEntities asOrderedCollection;
		addInteraction: TLNodeBasicInteraction popup;
		addInteraction: TLNodeBasicInteraction draggable;
		layout: RTDominanceTreeLayout.
		
	self edgeBuilder color: Color veryLightGray.
	self > #packages connectFollowingProperty: #providerNamespaces.
