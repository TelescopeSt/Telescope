drawing - removing
removeElementFromView: element associatedToDrawable: aTLDrawable
	self
		addCommand:
			(TLVisualizationRemoveElementCommand new
				visuId: self visuId;
				nodeId: element nodeId;
				yourself)