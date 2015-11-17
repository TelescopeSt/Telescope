tests
testStrategyForCompositeNodeCreationAlsoCreatingComposite
	| node |
	(strategy compositeProperty: {1}) childrenProperty: [:i | i to: i + 1].
	node := strategy createNodeFromEntity: #Digit.
	self assert: node isComposite.
	self assert: node entity equals: #Digit.
	self assert: node childrenNodes size equals: 1.
	self assert: node childrenNodes first isComposite.
	self assert: node childrenNodes first childrenNodes size equals: 2.
	self assert: node childrenNodes first childrenNodes first entity equals: 1.
	self assert: node childrenNodes first childrenNodes second entity equals: 2.
	self deny: node childrenNodes first childrenNodes first isComposite.
	self deny: node childrenNodes first childrenNodes second isComposite.
	