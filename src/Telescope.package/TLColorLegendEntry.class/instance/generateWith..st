generation
generateWith: aTLConnector
	| generated |
	generated := aTLConnector generateTLColorLegendEntry: self.
	self hierarchyChangeManaged.
	^ generated