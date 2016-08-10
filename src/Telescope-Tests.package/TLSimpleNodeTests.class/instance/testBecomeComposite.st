tests
testBecomeComposite
	self deny: node isComposite.
	node becomeComposite.
	self assert: node isComposite