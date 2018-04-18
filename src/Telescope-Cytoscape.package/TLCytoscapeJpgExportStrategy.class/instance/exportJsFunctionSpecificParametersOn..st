export
exportJsFunctionSpecificParametersOn: stream
	super exportJsFunctionSpecificParametersOn: stream.
	self quality
		ifNotNil: [ :q | 
			stream
				nextPutAll: ', quality:';
				nextPutAll: q forCytoscape ]