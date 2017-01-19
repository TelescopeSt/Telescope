finalIteration
groupsSelect: aBlockClosure
	^ self sourceSelect: (self selectBlockFrom: aBlockClosure and: #isGroup)