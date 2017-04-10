as yet unclassified
sendCommands: aCollectionOfCommands forVisu: aTLVisualization
	[ 
	aCollectionOfCommands
		ifEmpty: [ self sendNothingToDoForVisu: aTLVisualization ]
		ifNotEmpty: [ (self webSocketForVisu: aTLVisualization) sendMessage: (NeoJSONWriter toString: aCollectionOfCommands) ] ]
		on: ConnectionTimedOut
		do: [ 
			"The client leave the page before datas where sent"
			 ]