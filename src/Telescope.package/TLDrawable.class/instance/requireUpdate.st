state
requireUpdate
	self parent ifNotNil: [ self parent requireUpdate ].
	self isUpdateRequired: true