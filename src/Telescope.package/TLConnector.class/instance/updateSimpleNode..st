updating - node
updateSimpleNode: aNode
	self generateIfNecessaryConnectionsOf: aNode.
	
	aNode isUpdateRequired ifTrue: [
		self updateInteractionsOf: aNode.
		self updateElementNodeOf: aNode.
		self updateConnectionsOf: aNode.
		aNode updateDone
	]