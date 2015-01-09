generation - connection
generateIfNecessaryIncomingConnectionsOf: aNode
	aNode incomingConnections
		do: [ :connection | 
			[ self elementFromTLDrawable: connection fromNode ]
				on: NotFound
				do: [ ^ self ].
			(self shapeByDrawable includesKey: connection) ifFalse: [ connection generate ] ]