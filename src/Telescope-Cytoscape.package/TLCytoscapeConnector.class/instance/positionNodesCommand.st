accessing
positionNodesCommand
	^ positionNodesCommand ifNil: [ positionNodesCommand := TLVisualizationPositionNodesCommand new visuId: self visuId; yourself]