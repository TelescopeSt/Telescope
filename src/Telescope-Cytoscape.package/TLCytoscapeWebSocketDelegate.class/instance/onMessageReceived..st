as yet unclassified
onMessageReceived: message
	"On message received, we transform the Json string to dictionary; then create clients commands and execute those"

	^ (NeoJSONReader fromString: message)
		do: [ :aCommandDictionary | 
			(TLVisualizationClientsCommand createFrom: aCommandDictionary)
				executeOnVisu: (self visualizationByIdDictionary at: (aCommandDictionary at: #id)) ]