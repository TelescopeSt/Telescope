as yet unclassified
sendNothingToDoForVisu: aTLVisualization
	(self webSocketForVisu: aTLVisualization)
		sendMessage:
			(NeoJSONWriter
				toString:
					(TLSendMessageOnErrorCommand
						new: aTLVisualization visuId
						withError: (TLNothingToDoException new messageText: 'Nothing to do')
						on: (self webSocketForVisu: aTLVisualization)))