as yet unclassified
associateSocket: aWebSocket toVisuId: aVisuId
	[ self websocketByVisu at: (self visualizationWithId: aVisuId) put: aWebSocket ]
		on: KeyNotFound
		do: [ 
			aWebSocket
				sendMessage:
					'[{ "command": "error", "visuId": ' , aVisuId , ', "detail":"noVisu", "message":"' , self messageOnError , '"}]' ]