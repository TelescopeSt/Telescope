building
keepNode: aNode
	aNode moveToGroup: self > #callNodes.	
	(self > #incomingCalls) removeAll.
	(self > #outgoingCalls) removeAll