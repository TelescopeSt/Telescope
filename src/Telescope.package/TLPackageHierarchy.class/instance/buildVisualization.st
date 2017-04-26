building
buildVisualization
	self styleSheet > #connection > #head shape: TLNoShape.
	
	(self > #packages) styleSheet
		nodeLabel: self nameProperty position: #top;
		labelSize: 10;
		width: (self widthProperty ifNil: [ 30 ]);
		height: (self heightProperty ifNil: [ 30 ]);
		textColor: Color black.
		
	(self > #packages)
		addNodesFromEntities: self entities;
		connectFollowingProperty: self property;
		addInteraction: TLPopUpAction onMouseOver;
		layout:
			(TLTreeLayout new
				leavesGap: 100;
				levelGap: 100;
				yourself)