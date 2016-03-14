action
connectNewNodes: newNodes toExistingOnesInVisu: aVisualization
	newNodes
		do: [ :aNode | aNode connectIfNotTo: (aVisualization nodesForEntities: (self obtainExpandEntitiesFrom: aNode)) ]