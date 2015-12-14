*Telescope-Cytoscape
availableForCytoscapeConnection
	^ [ 
	self forCytoscapeConnection.
	true ]
		on: TLCytoscapeNotSupportedFunctionalityException
		do: [ false ]