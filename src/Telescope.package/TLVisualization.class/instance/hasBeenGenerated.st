private-connector
hasBeenGenerated
	^ self state at: #hasBeenGenerated ifAbsentPut: [ false ]