updating - node
updateElementNodeOf: aDrawable
	self
		addCommand:
			(TLVisualizationCustomizeNodeCommand new
				virtualNode: (self elementFromTLDrawable: aDrawable);
				visuId: self visuId;
				style: (aDrawable effectiveStyleSheet cytoscapeNodeStyleFor: aDrawable entity))