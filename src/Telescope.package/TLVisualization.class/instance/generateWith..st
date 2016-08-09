private-connector
generateWith: aTLConnector
	| generated |
	self buildVisualization.
	generated := aTLConnector generateVisualization: self.
	self hierarchyChangeManaged.
	^ generated