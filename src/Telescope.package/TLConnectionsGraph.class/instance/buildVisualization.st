building
buildVisualization
	self initializeElementLevels.
	self buildTheFlowFrom: (levelsCollection at: 1) currentRank: 1.
	self layout: (RTHorizontalLineLayout new alignCenter; gapSize: 30).