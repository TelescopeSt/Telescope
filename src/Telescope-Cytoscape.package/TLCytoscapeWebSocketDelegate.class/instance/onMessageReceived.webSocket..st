as yet unclassified
onMessageReceived: message webSocket: aWebSocket
	"On message received, we transform the Json string to dictionary; then create clients commands and execute those"

	| visusToUpdate |
	visusToUpdate := Set new.	"Execute clients commands on server"
	(NeoJSONReader fromString: message)
		do: [ :aCommandDictionary | 
			visusToUpdate add: (aCommandDictionary at: #id).
			(TLVisualizationClientsCommand createFrom: aCommandDictionary)
				executeOnVisu: (self visualizationByIdDictionary at: (aCommandDictionary at: #id)) ].	"Then send commands to clients"
	aWebSocket
		sendMessage:
			(NeoJSONWriter
				toString:
					(visusToUpdate flatCollect: [ :aVisuId | (self visualizationByIdDictionary at: aVisuId) generator removeAllCommands ] as: OrderedCollection))