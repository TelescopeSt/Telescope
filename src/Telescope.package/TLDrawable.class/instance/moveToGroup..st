actions
moveToGroup: aTLEntitiesGroup
	self parent requireUpdateAndLayoutApplication.
	aTLEntitiesGroup addDrawable: self.
	self requireUpdateAndLayoutApplication.