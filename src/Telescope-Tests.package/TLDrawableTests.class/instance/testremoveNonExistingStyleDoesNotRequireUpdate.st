tests
testremoveNonExistingStyleDoesNotRequireUpdate
	self deny: drawable isUpdateRequired.
	drawable removeStyle: #style.
	self deny: drawable isUpdateRequired