exports
defaultPngExport
	self
		exportStrategy:
			(TLCytoscapePngExportStrategy new
				scale: 5;
				yourself)