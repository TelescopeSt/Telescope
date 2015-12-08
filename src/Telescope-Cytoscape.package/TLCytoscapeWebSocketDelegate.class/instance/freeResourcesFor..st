as yet unclassified
freeResourcesFor: webSocket
	(self visuByWebsocket removeKey: webSocket) do: [ :aVisuKey | self visualizationByIdDictionary removeKey: aVisuKey ]