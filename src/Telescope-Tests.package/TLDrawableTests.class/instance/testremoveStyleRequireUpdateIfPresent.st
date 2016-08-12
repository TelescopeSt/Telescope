tests
testremoveStyleRequireUpdateIfPresent
	self deny: drawable isUpdateRequired.
	drawable addStyle: #style.
	drawable isUpdateRequired: false.
	drawable removeStyle: #style.
	self assert: drawable isUpdateRequired