generation - connection
generateIfNecessaryIncomingConnectionsOf: aNode
	aNode incomingConnections
		do: [ :connection | 
			[ 
			self elementFromTLDrawable: connection fromNode.
			(self shapeByDrawable includesKey: connection)
				ifFalse: [ connection generate ] ]
				on: NotFound
				do: [  ] ]