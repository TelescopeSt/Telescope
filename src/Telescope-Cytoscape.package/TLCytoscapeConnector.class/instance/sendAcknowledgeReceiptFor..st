executing - interaction
sendAcknowledgeReceiptFor: aTLDrawable
	self commandsQueue addCommand: (TLAcknowledgeReceiptCommand new visuId: self visuId).
	aTLDrawable visualization ifNotNil:[aTLDrawable visualization update] ifNil:["probably a missclic on a deleted link/node by previous interaction but the clic is possible when lag in interface or network "]