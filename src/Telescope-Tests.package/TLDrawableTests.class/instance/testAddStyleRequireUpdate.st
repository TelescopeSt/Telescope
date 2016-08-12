tests
testAddStyleRequireUpdate
	self deny: drawable isUpdateRequired.
	drawable addStyle: #style.
	self assert: drawable isUpdateRequired