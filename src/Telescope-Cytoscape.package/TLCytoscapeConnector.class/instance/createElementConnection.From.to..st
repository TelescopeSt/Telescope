generation - connection
createElementConnection: aTLConnection From: fromNode to: toNode
	| edgeId |
	self flag: 'refactor about edges required'.
	
	edgeId := self generateDrawableId.
	
	self addCommand:  (TLVisualizationAddEdgeCommand new
		edgeId: edgeId;
		fromNodeId: (self elementFromTLDrawable: fromNode) nodeId;
		toNodeId: (self elementFromTLDrawable: toNode) nodeId;
		style: (aTLConnection effectiveStyleSheet cytoscapeConnectionStyleFor: aTLConnection) ;
		visuId: visuId).
	
	^ edgeId