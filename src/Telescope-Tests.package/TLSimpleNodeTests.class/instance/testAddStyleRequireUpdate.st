tests
testAddStyleRequireUpdate
	self deny: node isUpdateRequired.
	node addStyle: #style.
	self assert: node isUpdateRequired