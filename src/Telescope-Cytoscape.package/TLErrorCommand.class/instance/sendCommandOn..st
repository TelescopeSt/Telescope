action
sendCommandOn: aWebSocket
	aWebSocket
		sendMessage:
			(NeoJSONWriter
				toString:
					{{(#command -> 'error').
					(#visuId -> self visuId).
					(#detail -> self type).
					(#message -> self message)} asDictionary})