as yet unclassified
keepNode: aNode
	aNode moveToGroup: self > #callNodes.	
	(self > #incomingCalls) removeAll.
	(self > #outgoingCalls) removeAll.