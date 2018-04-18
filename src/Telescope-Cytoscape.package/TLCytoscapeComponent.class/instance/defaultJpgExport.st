exports
defaultJpgExport
	self
		exportStrategy:
			(TLCytoscapePngExportStrategy new
				scale: 5;
				quality: 1;
				yourself)