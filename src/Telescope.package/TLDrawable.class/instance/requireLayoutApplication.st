state
requireLayoutApplication
	self parent ifNotNil: [ self parent requireLayoutApplication ].
	self isLayoutApplicationRequired: true