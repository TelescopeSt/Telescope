as yet unclassified
associateSocket: aWebSocket toVisuId: aVisuId
	self websocketByVisu at: (self visualizationWithId: aVisuId) put: aWebSocket