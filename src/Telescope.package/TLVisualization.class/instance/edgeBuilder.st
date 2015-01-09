accessing
edgeBuilder
	edgeBuilder ifNil: [ edgeBuilder := self defaultEdgeBuilder ].
	^ edgeBuilder