building
buildVisualization

	( self > #packages ) styleSheet
		shape: ( TLLabelShape new text: #name );
		color: [ :each | Color black ].
		
	self > #packages
		addNodesFromEntities: self packageEntities;
		addInteraction: TLNodeBasicInteraction popup;
		addInteraction: TLNodeBasicInteraction draggable;
		layout: ( RTHorizontalTreeLayout new layered ).
		
	self edgeBuilder: ( TLEdgeOrthogonalLineBuilder new color: Color veryLightGray ).
	self > #packages connectFollowingProperty: #parentScope.