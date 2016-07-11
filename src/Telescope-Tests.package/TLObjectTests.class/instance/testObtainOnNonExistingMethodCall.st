tests
testObtainOnNonExistingMethodCall
	self should: [ tlObject obtain: #foo on: tlObject ] raise: MessageNotUnderstood