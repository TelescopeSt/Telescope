placing
placeLineOfNodes: lineOfNodesWithPosition maxHeight: maxHeight
	lineOfNodesWithPosition
		keysAndValuesDo: [ :aNode :aPositionAndSize | 
			aNode occupyMaxSpace
				ifTrue: [ 
					self changeNode: aNode dimension: aNode width @ maxHeight ].
			self
				definePosition:
					(self adjustPosition: aPositionAndSize key withHeight: aPositionAndSize value forMaxHeight: maxHeight)
				forNode: aNode ]