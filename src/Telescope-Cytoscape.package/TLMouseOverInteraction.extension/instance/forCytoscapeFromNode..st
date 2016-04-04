*Telescope-Cytoscape
forCytoscapeFromNode: aTLNode
	^ (self action forCytoscapeFromNode: aTLNode)
		at: 'show' put: {('event' -> #mouseover)} asDictionary;
		at: 'hide' put: {('event' -> #mouseout)} asDictionary;
		yourself