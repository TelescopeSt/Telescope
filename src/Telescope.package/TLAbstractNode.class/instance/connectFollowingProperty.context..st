connect
connectFollowingProperty: aBlockOrSymbol context: aTLEntitiesGroup
	| target |
	target := aBlockOrSymbol value: self entity.
	^ (target isCollection and: [ target isString not ])
		ifTrue: [ {(self connectTo: (aTLEntitiesGroup nodesForEntitiesIgnoringNotFound: target))} ]
		ifFalse: [ 
			[ {(self connectTo: (aTLEntitiesGroup nodeForEntity: target))} ]
				on: NotFound
				do: [ #() ] ]