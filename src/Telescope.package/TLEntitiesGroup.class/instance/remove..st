accessing
remove: aTLDrawable
	self telescopeEntities remove: aTLDrawable.
	self requireUpdateAndLayoutApplication.
	aTLDrawable parent: nil.
	aTLDrawable removed.