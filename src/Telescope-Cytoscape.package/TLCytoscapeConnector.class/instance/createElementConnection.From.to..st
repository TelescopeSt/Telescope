generation - connection
createElementConnection: aTLConnection From: fromNode to: toNode
	| edgeId |
	edgeId := self generateDrawableId.
	
	self addCommand:  (TLVisualizationAddEdgeCommand new
		edgeId: edgeId;
		mouseOverInteraction: (aTLConnection allInteractions anySatisfy: #isMouseOver);
				
		fromNodeId: (self elementFromTLDrawable: fromNode) nodeId;
		toNodeId: (self elementFromTLDrawable: toNode) nodeId;
		style: (aTLConnection effectiveStyleSheet cytoscapeConnectionStyleFor: aTLConnection) ;
		visuId: self visuId).
	
	^ edgeId