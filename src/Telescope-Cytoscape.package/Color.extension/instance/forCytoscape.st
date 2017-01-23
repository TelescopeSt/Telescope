*Telescope-Cytoscape
forCytoscape
	^ ['#' , self asHexString ]on: MessageNotUnderstood do:[self asHTMLColor ]