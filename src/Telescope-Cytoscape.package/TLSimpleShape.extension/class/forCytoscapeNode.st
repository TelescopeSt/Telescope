*Telescope-Cytoscape
forCytoscapeNode
	^ self cytoscapeAttribute = #shape
		ifTrue: [ super forCytoscapeNode ]
		ifFalse: [ self cytoscapePolygonPoints ]