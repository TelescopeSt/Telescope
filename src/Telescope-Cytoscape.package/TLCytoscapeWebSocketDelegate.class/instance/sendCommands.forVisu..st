as yet unclassified
sendCommands: aCollectionOfCommands forVisu: aTLVisualization
	(self webSocketForVisu: aTLVisualization)
		sendMessage:
			(NeoJSONWriter
				toString: aCollectionOfCommands)