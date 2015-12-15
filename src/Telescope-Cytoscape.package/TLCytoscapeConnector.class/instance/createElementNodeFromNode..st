generation - node
createElementNodeFromNode: aNode
	| styleSheet nodeId virtualNode |
	nodeId := self generateDrawableId.
	styleSheet := aNode effectiveStyleSheet.
	virtualNode := TLVirtualNode new
		nodeId: nodeId;
		dimension: (styleSheet width)@(styleSheet height);
		position: (500 atRandom @ 500 atRandom)
		yourself.
	self flag: 'temp random position for developping'.
	self
		addCommand:
			(TLVisualizationAddNodeCommand new
				virtualNode: virtualNode;
				visuId: self visuId;
				style:
						(styleSheet cytoscapeNodeStyleFor: aNode entity)).
								
	^ virtualNode