accessing
labelBuilder
	^ labelBuilder ifNil: [ self defaultLabelBuilder ]