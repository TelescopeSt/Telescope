adding
addDrawable: aTLDrawable
	aTLDrawable parent: self.
	self telescopeEntities addLast: aTLDrawable.
	self requireUpdateAndLayoutApplication