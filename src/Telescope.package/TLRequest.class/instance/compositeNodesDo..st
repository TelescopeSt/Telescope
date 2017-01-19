finalIteration
compositeNodesDo: aBlockClosure
	^ self sourceSelect: [ :drawable | drawable isNode and: [ drawable isComposite ] ] thenDo: aBlockClosure