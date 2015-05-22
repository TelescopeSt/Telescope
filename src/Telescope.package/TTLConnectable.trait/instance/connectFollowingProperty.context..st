connect
connectFollowingProperty: aBlockOrSymbol context: aTLEntitiesGroup
	self do: [ :tlEntity | 
			tlEntity isNode
				ifTrue: [ 
					| target |
					target := aBlockOrSymbol value: tlEntity entity.
					(target isCollection and: [ target isString not ])
						ifTrue: [ tlEntity connectTo: (aTLEntitiesGroup nodesForEntitiesIgnoringNotFound: target) ]
						ifFalse: [ 
							[ tlEntity connectTo: (aTLEntitiesGroup nodeForEntity: target) ]
								on: NotFound
								do: [  ] ] ]
				ifFalse: [ tlEntity connectFollowingProperty: aBlockOrSymbol context: aTLEntitiesGroup ] ]