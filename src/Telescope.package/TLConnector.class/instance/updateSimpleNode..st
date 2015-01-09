updating - node
updateSimpleNode: aNode
	self flag: 'Not sure if ti is the right way to do it'.
	self generateIfNecessaryConnectionsOf: aNode.
	
	aNode isUpdateRequired ifTrue: [
		self updateInteractionsOf: aNode.
		self updateElementNodeOf: aNode.
		self updateConnectionsOf: aNode.
		aNode updateDone
	]