as yet unclassified
associateSocket: aWebSocket toVisuId: aVisuId
	[ self websocketByVisu at: (self visualizationWithId: aVisuId) put: aWebSocket ]
		on: KeyNotFound
		do: [ TLGenerationErrorCommand new: aVisuId withMessage: self messageOnError on: aWebSocket ]