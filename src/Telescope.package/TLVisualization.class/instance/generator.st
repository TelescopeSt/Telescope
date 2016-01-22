accessing
generator
	generator ifNil: [ self generator: self defaultConnector ].
	^ generator