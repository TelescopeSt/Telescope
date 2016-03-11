updating - interaction
updateTriggerOf: aShapeTrigger 
	self
		addCommand:
			(TLVisualizationCustomizeElementCommand new
				virtualNode: (self elementFromTLDrawable: aShapeTrigger);
				mouseOverInteraction: (aShapeTrigger allInteractions anySatisfy: #isMouseOver);
				visuId: self visuId;
				style: (aShapeTrigger effectiveStyleSheet cytoscapeTriggerStyleFor: aShapeTrigger))