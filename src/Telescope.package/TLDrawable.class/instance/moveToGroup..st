as yet unclassified
moveToGroup: aTLEntitiesGroup
	self parent requireUpdateAndLayoutApplication.
	self parent telescopeEntities remove: self.
	aTLEntitiesGroup addDrawable: self.
	self requireUpdateAndLayoutApplication.