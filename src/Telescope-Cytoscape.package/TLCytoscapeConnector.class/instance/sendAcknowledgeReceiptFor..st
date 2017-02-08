executing - interaction
sendAcknowledgeReceiptFor: aTLDrawable
	self commandsQueue addCommand: (TLAcknowledgeReceiptCommand new visuId: self visuId).
	aTLDrawable visualization update