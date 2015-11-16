tests
testStrategyForCompositeNodeCreation
	| node |
	strategy compositeProperty: (1 to: 9).
	node := strategy createNodeFromEntity: #Digit.
	self assert: node isComposite.
	self assert: node entity equals: #Digit.
	self assert: node childrenNodes size equals: 9