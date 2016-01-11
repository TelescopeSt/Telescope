*Telescope-Cytoscape
setEdgesFromElements: elements
	self
		edges:
			((elements flatCollect: #incomingEdges)
				select: [ :anEdge | anEdge isUsedInLayout and: (elements includes: anEdge from) ])