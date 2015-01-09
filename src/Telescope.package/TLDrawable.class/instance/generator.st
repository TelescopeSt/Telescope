accessing
generator
	^ generator ifNotNil: [ generator ] ifNil: [ self parent generator ]