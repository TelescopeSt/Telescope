tests
testChildrenCreationWithProperty
	node entity: 30.
	node childrenProperty: #primeFactors.
	node createChildrenNodes.
	self assert: node childrenNodes size equals: 3.
	self assert: node childrenNodes first entity equals: 2.
	self assert: node childrenNodes second entity equals: 3.
	self assert: node childrenNodes third entity equals: 5