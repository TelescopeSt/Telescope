updating - connection
updateConnectionsOf: aNode
	aNode incomingConnections do: [ :connection | connection updateWith: self ].
	aNode outgoingConnections do: [ :connection | connection updateWith: self ]