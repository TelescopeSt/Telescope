finalIteration
simpleNodesSelect: aBlockClosure
	^ self
		sourceSelect:
			(self selectBlockFrom: aBlockClosure and: [ :drawable | drawable isNode and: [ drawable isComposite not ] ])