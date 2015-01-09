accessing
edgeBuilder
	^ edgeBuilder ifNil: [ self parent edgeBuilder ]