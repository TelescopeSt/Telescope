removing - node
removeCompositeNode: aNode
	aNode expanded
		ifTrue: [ 
			[ aNode childrenNodes removeWith: self ]
				on: KeyNotFound
				do: [  ] ].
	self removeSimpleNode: aNode