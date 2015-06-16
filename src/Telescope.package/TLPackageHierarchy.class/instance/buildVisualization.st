building
buildVisualization

	( self > #packages ) styleSheet
		nodeLabel: self nameProperty;
		textColor: Color black.
	self edgeBuilder: ( TLEdgeOrthogonalLineBuilder new color: Color veryLightGray ).
		
	self > #packages
		addNodesFromEntities: self entities;
		connectFollowingProperty: self property;
		addInteraction: TLNodeBasicInteraction popup;
		addInteraction: TLNodeBasicInteraction draggable;
		layout: ( RTHorizontalTreeLayout new layered ).
		
	