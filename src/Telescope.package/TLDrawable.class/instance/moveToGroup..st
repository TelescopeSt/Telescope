actions
moveToGroup: aTLEntitiesGroup
	self parent requireUpdateAndLayoutApplication.
	self parent telescopeEntities remove: self.
	aTLEntitiesGroup addDrawable: self.
	self requireUpdateAndLayoutApplication.