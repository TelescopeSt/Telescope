accessing
labelPosition
	^ labelPosition ifNil: [ self defaultPlacement ]