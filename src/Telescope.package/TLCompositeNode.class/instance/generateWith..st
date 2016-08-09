private-connector
generateWith: aGenerator
	| generated |
	generated := aGenerator generateCompositeNode: self.
	self hierarchyChangeManaged.
	^ generated