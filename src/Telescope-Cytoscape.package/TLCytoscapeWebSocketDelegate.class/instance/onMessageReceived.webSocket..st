as yet unclassified
onMessageReceived: message webSocket: aWebSocket
	"On message received, we transform the Json string to dictionary; then create clients commands and execute those"

	| visusToUpdate |
	visusToUpdate := Set new.	"Execute clients commands on server"
	(NeoJSONReader fromString: message)
		do: [ :aCommandDictionary | 
			"register the visu"
			[ 
			self associateSocket: aWebSocket toVisuId: (aCommandDictionary at: #id).	"then execute command"
			(TLVisualizationClientsCommand createFrom: aCommandDictionary)
				executeOnVisu: (self visualizationByIdDictionary at: (aCommandDictionary at: #id)) ]
				on: Error
				do: [ :e | 
					self class development
						ifFalse: [ TLErrorCommand new: (aCommandDictionary at: #id) withError: e on:  aWebSocket]
						ifTrue: [ e pass ] ] ]