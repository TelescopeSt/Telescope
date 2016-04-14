private
positionNodesInTree: aTree yDec: aDecTable level: aLevel xStart: xStart
	| xDec |
	xDec := xStart.
	aTree
		keysAndValuesDo: [ :aNode :aBranch | 
			| usedWidth nodeDimension |
			nodeDimension := self obtainsNodeDimension: aNode.
			usedWidth := nodeDimension x
				max:
					(self
						positionNodesInTree: aBranch
						yDec: aDecTable
						level: aLevel + 1
						xStart: xDec).
			self definePosition: (xDec + (usedWidth / 2)) @ ((aDecTable at: aLevel) + (nodeDimension y / 2)) forNode: aNode.
			xDec := xDec + usedWidth + self leavesGap ].
	^ xDec - xStart - self leavesGap