as yet unclassified
sendCommandOn: aWebSocket
   aWebSocket
				sendMessage:
					(NeoJSONWriter toString: {{ #command -> 'acknoledgeReceipt' . #visuId -> self visuId } asDictionary})