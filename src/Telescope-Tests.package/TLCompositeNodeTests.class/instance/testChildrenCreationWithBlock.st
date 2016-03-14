tests
testChildrenCreationWithBlock
	node entity: 42.
	node childrenProperty: [ :entity | 
			self assert: entity equals: 42.
			#(1 2 3) ].
	node createChildrenNodes.
	self assert: node childrenNodes size equals: 3.
	self assert: node childrenNodes first entity equals: 1.
	self assert: node childrenNodes second entity equals: 2.
	self assert: node childrenNodes third entity equals: 3