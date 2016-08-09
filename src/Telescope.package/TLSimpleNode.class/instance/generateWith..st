private-connector
generateWith: aConnector
	| generated |
	generated := aConnector generateSimpleNode: self.
	self hierarchyChangeManaged.
	^ generated