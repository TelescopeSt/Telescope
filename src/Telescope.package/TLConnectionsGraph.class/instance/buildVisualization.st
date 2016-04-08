building
buildVisualization
	self initializeElementLevels.
	self buildTheFlowFrom: (levelsCollection at: 1) currentRank: 1.
	self layout: (TLLinearLayout gap: 30).