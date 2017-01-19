finalIteration
nodesSelect: aBlockClosure
	^ self sourceSelect: (self selectBlockFrom: aBlockClosure and: #isNode)