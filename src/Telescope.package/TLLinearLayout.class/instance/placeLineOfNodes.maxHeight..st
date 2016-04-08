placing
placeLineOfNodes: lineOfNodesWithPosition maxHeight: maxHeight
	lineOfNodesWithPosition
		keysAndValuesDo: [ :aNode :aPositionAndSize | 
			self
				definePosition:
					(self adjustPosition: aPositionAndSize key withHeight: aPositionAndSize value forMaxHeight: maxHeight)
				forNode: aNode ]