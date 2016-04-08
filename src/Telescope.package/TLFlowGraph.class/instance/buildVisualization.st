building
buildVisualization
	self buildTheFlowFrom: {self entryPoint} currentRank: 1.
	self layout: (TLLinearLayout gap: 30).