drawing - removing
removeElementFromView: element associatedToDrawable: aTLDrawable
	self
		addCommand:
			(TLVisualizationRemoveNodeCommand new
				visuId: self visuId;
				nodeId: element nodeId;
				yourself)