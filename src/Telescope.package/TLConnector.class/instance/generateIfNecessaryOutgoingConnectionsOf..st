generation - connection
generateIfNecessaryOutgoingConnectionsOf: aNode
	aNode outgoingConnections
		do: [ :connection | 
			[ 
			self elementFromTLDrawable: connection toNode.
			(self shapeByDrawable includesKey: connection)
				ifFalse: [ connection generate ] ]
				on: NotFound
				do: [  ] ]