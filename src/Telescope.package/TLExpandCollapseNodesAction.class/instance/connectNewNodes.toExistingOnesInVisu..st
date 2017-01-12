action
connectNewNodes: newNodes toExistingOnesInVisu: aVisualization
	newNodes
		do: [ :aNode | aNode connectIfNotTo: (aVisualization nodesForEntities: (self obtain: self property on: aNode entity)) ]