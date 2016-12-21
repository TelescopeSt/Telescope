generation - group
postGenerationFor: aTLVisualization
	self
		addCommand:
			(TLVisualizationGeneratedCommand
				new
				visuId: self visuId;
				yourself).
	TLCytoscapeWebSocketDelegate delegate sendCommands: self removeAllCommands forVisu: aTLVisualization