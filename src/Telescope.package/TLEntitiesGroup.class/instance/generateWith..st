private-connector
generateWith: aGenerator
	| generated |
	generated := aGenerator generateGroup: self.
	self hierarchyChangeManaged.
	^ generated