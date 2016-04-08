as yet unclassified
buildVisualization
	| first |
	first := self data first.
	self rank at: first put: 0.
	(self > 0) addNodeFromEntity: first.
	self buildCycleStartingAt: first.
	(self > 0) layout: (TLLinearLayout topToBottom gap: 30).
	self layout: (RTCircleLayout "new gapSize: 30").