building
buildVisualization

	( self > #packages ) styleSheet
		shape: ( TLLabelShape new text: #name );
		color: Color black.
		
	self > #packages
		addNodesFromEntities: self packageEntities asOrderedCollection;
		addInteraction: TLNodeBasicInteraction popup;
		addInteraction: TLNodeBasicInteraction draggable;
		layout: ( RTHorizontalTreeLayout new layered ).
		
	self edgeBuilder: ( TLEdgeOrthogonalLineBuilder new color: Color veryLightGray ).
	self > #packages connectFollowingProperty: #belongsTo.