javascript
jsExportForVisu: aVisuId
	^ String
		streamContents: [ :stream | 
			stream
				nextPutAll: 'Telescope.';
				nextPutAll: self telescopeExportFunction;
				nextPutAll: '("';
				nextPutAll: self fileName;
				nextPutAll: '", telescope.visuWithId(';
				nextPutAll: aVisuId asString;
				nextPutAll: ').'.
			self exportJsFunctionOn: stream.
			stream nextPutAll: ');' ]