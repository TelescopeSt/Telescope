updating - connection
updateConnection: aConnection
	aConnection isUpdateRequired ifTrue: [
		self updateInteractionsOf: aConnection.
		self updateEdgeOf: aConnection.
		aConnection updateDone
	]