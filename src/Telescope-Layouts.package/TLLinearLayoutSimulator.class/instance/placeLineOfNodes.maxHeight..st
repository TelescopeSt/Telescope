placing
placeLineOfNodes: lineOfNodesWithPosition maxHeight: maxHeight
	lineOfNodesWithPosition values last
		in: [ :nodeWithPosition | totalDimension := totalDimension max: nodeWithPosition key + ((nodeWithPosition value / 2) @ (maxHeight / 2)) ]