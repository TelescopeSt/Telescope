building
buildVisualization

	( self > #packages ) styleSheet
		nodeLabel: self nameProperty;
		textColor: Color black.
	(self styleSheet > #connection) curveStyle: #segments.
		
	self > #packages
		addNodesFromEntities: self entities;
		connectFollowingProperty: self property;
		addInteraction: TLNodeBasicInteraction popup;
		addInteraction: TLNodeBasicInteraction draggable;
		layout: ( RTHorizontalTreeLayout new layered ).
		
	