updating - connection
updateEdgeOf: aConnection
	self
		addCommand:
			(TLVisualizationCustomizeConnectionCommand new
				connectionId: (self idForDrawable: aConnection);
				mouseOverInteraction: (aConnection allInteractions anySatisfy: #isMouseOver);
		
				visuId: self visuId;
				style: (aConnection effectiveStyleSheet cytoscapeConnectionStyleFor: aConnection))