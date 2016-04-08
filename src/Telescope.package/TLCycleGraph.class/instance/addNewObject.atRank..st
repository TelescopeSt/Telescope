as yet unclassified
addNewObject: obj atRank: nextRank
	self rank at: obj put: nextRank.
	self > nextRank addNodeFromEntity: obj.
	self > nextRank layout: (TLLinearLayout topToBottom gap: 30).
	^ self buildCycleStartingAt: obj