tests
testObtainOnBlock
	self assert: (tlObject obtain: [ :object | {object} ] on: tlObject) equals: {tlObject}