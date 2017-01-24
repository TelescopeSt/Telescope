action
obtainsNodesToConnectAt: aNode
	| entitiesToConnect |
	entitiesToConnect := self obtain: self property on: aNode entity.
	^ (self obtainContextFor: aNode) select: [ :aPotentialNode | entitiesToConnect includes: aPotentialNode entity ]