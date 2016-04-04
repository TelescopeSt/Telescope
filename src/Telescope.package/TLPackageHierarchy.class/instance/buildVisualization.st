building
buildVisualization
	self styleSheet > #connection > #head color: Color red;shape: TLNoShape.
	
	(self > #packages) styleSheet
		nodeLabel: self nameProperty;
		textColor: Color black.
	self > #packages
		addNodesFromEntities: self entities;
		connectFollowingProperty: self property;
		addInteraction: TLPopUpAction onMouseOver;
		addInteraction: TLNodeBasicInteraction draggable;
		layout: RTHorizontalTreeLayout new layered