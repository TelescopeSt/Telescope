updating - node
updateElementNodeOf: aDrawable
	self
		addCommand:
			(TLVisualizationCustomizeElementCommand new
				virtualNode: (self elementFromTLDrawable: aDrawable);
				mouseOverInteraction: (aDrawable allInteractions anySatisfy: #isMouseOver);
				visuId: self visuId;
				style: (aDrawable effectiveStyleSheet cytoscapeNodeStyleFor: aDrawable))