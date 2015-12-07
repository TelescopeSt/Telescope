generation - connection
createElementConnectionFrom: fromNode to: toNode using: aShape
	| edgeId |
	self flag: 'refactor about edges required'.
	
	edgeId := self generateDrawableId.
	
	self addCommand:  (TLVisualizationAddEdgeCommand new
		edgeId: edgeId;
		fromNodeId: (self elementFromTLDrawable: fromNode);
		toNodeId: (self elementFromTLDrawable: toNode);
		visuId: visuId).
	
	^ edgeId