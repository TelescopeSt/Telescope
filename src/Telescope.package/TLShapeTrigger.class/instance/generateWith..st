generation
generateWith: aConnector
	| generated |
	generated := aConnector generateTrigger: self.
	self hierarchyChangeManaged.
	^ generated