export
exportJsFunctionSpecificParametersOn: stream
	stream
		nextPutAll: 'full:';
		nextPutAll: self fullExport asString.
	self backgroundColor
		ifNotNil: [ :bg | 
			stream
				nextPutAll: ', bg:"';
				nextPutAll: bg forCytoscape;
				nextPut: $" ].
	self scale
		ifNotNil: [ :s | 
			stream
				nextPutAll: ', scale:';
				nextPutAll: scale forCytoscape ].
	self maxHeight
		ifNotNil: [ :mh | 
			stream
				nextPutAll: ', maxHeight:';
				nextPutAll: mh forCytoscape ].
	self maxWidth
		ifNotNil: [ :mw | 
			stream
				nextPutAll: ', maxWidth:';
				nextPutAll: mw forCytoscape ]