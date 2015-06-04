removing - node
removeCompositeNode: aNode
	aNode expanded
		ifTrue: [ 
			[ aNode childrenGroup removeWith: self ]
				on: KeyNotFound
				do: [  ] ].
	self removeSimpleNode: aNode