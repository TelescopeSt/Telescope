private
buildTheFlowFrom: aCollectionOfObjects currentRank: anIntegerRank
	aCollectionOfObjects
		ifNotEmpty: [ 
			self addNodes: aCollectionOfObjects at: anIntegerRank.
			self buildTheFlowFrom: (self nextLevelNodes: aCollectionOfObjects atLevel: anIntegerRank) currentRank: anIntegerRank + 1.
			self addConnectionForGroupAt: anIntegerRank ]