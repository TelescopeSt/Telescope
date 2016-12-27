adding
addIncomingConnection: aTLConnection
	self incomingConnections add: aTLConnection.
	self requireUpdateForConnections