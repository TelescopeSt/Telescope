sugar
parentNodes
	^ self collection select: [ :drawable | drawable parentNode notNil ] thenCollect: #parentNode