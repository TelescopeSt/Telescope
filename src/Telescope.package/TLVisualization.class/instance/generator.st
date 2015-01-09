accessing
generator
	generator ifNil: [ self generator: self defaultGenerator ].
	^ generator