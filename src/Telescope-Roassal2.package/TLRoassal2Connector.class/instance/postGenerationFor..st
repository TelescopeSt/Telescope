generation - group
postGenerationFor: aTLVisualization
aTLVisualization allConnections
		do: [ :aConnection | 
			[ (self elementFromTLDrawable: aConnection) trachelShape pushFront ]
				on: KeyNotFound
				do: [ 
					"the connection is not managed because it does not exist"
					 ] ]