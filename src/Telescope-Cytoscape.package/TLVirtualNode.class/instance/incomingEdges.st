edges
incomingEdges
	incomingEdges
		ifNil: [ 
			| generator |
			generator := self realNode generator.
			incomingEdges := self realNode incomingConnections
				collect: [ :aConnection | 
					TLVirtualConnection new
						from: (generator elementFromTLDrawable: aConnection fromNode);
						to: self;
						yourself ]
				as: OrderedCollection ].
	^ incomingEdges