export
exportJsFunctionParametersOn: aStream
	aStream nextPutAll: '({'.
	self exportJsFunctionSpecificParametersOn: aStream.
	aStream nextPutAll: '})'