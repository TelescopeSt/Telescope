generation - connection
generateIfNecessaryOutgoingConnectionsOf: aNode
	aNode outgoingConnections
		do: [ :connection | 
			[ self elementFromTLDrawable: connection toNode ]
				on: NotFound
				do: [ ^ self ].
			(self shapeByDrawable includesKey: connection) ifFalse: [ connection generate ]
			 ]