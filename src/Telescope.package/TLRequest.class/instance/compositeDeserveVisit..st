optimisation
compositeDeserveVisit: aTLCompositeNode
	^ (self strategies allSatisfy: #ignoreVisibility) or: [ aTLCompositeNode expanded ]