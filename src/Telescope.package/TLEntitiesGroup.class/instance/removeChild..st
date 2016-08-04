removing
removeChild: aTLDrawable
	self telescopeEntities remove: aTLDrawable.
	self requireUpdateAndLayoutApplication.
	aTLDrawable removed.