export
exportJsFunctionParameters
	^ String
		streamContents: [ :stream | 
			stream nextPutAll: '({'.
			self exportJsFunctionSpecificParametersOn: stream.
			stream nextPutAll: '})' ]