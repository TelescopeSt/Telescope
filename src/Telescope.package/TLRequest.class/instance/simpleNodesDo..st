finalIteration
simpleNodesDo: aBlockClosure
	^ self sourceSelect: [ :drawable | drawable isNode and: [ drawable isComposite not ] ] thenDo: aBlockClosure