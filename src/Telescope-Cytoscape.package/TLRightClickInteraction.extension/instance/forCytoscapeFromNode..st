*Telescope-Cytoscape
forCytoscapeFromNode: aTLNode
	^ (self action forCytoscapeFromNode: aTLNode)
		at: 'show' put: {('event' -> #cxttap)} asDictionary;
		yourself