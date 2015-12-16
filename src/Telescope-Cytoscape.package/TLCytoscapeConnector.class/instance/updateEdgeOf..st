updating - connection
updateEdgeOf: aConnection
	self
		addCommand:
			(TLVisualizationCustomizeConnectionCommand new
				connectionId: (self idForDrawable: aConnection);
				visuId: self visuId;
				style: (aConnection effectiveStyleSheet cytoscapeConnectionStyleFor: aConnection))