finalIteration
groupsDo: aBlockClosure
	^ self sourceSelect: #isGroup thenDo: aBlockClosure