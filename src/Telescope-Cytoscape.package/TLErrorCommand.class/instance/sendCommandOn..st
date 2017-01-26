as yet unclassified
sendCommandOn: aWebSocket
   aWebSocket
				sendMessage:
					'[{ "command": "error", "visuId": ' , self visuId , ', "detail":"',self type,'", "message":"' , self message , '"}]'.