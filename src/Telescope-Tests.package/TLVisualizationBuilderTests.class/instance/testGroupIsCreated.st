tests
testGroupIsCreated
	| group |
	self assert: visualization subGroupsDictionary size equals: 0.
	group := visualization > #test.
	self assert: visualization subGroupsDictionary size equals: 1.
	self assert: group isEmpty.
