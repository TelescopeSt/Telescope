view
removeElementConnectionFromView: element
	self
		addCommand:
			(TLVisualizationRemoveElementCommand new
				visuId: self visuId;
				nodeId: element;
				yourself)