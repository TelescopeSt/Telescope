building
buildVisualization
	self buildTheFlowFrom: {self entryPoint} currentRank: 0.
	self layout: (RTHorizontalLineLayout new alignCenter; gapSize: 30).