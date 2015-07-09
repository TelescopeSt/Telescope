updating - connection
updateConnectionsOf: aNode
	|connectionUpdatingBlock|

	connectionUpdatingBlock := [ :connection | [connection updateWith: self] on: KeyNotFound do: [ "here the connection has not been generated before so is unknown for the connector"[connection generateWith: self] on: NotFound do: [ "in that case the other node is not yet generated" ] ] ].

	aNode incomingConnections do: connectionUpdatingBlock.
	aNode outgoingConnections do: connectionUpdatingBlock