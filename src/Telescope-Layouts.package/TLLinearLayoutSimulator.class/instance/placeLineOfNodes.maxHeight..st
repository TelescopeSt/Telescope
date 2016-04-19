placing
placeLineOfNodes: lineOfNodesWithPosition maxHeight: maxHeight
	self flag: #TODO.	"We have an approximation because we are using the position of the last node and not the position of the node with the boggest height "
	lineOfNodesWithPosition values last
		in: [ :nodeWithPosition | totalDimension := totalDimension max: nodeWithPosition key + ((nodeWithPosition value / 2) @ (maxHeight / 2)) ]