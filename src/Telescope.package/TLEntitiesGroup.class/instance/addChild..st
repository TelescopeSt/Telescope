adding
addChild: aTLDrawable
	self telescopeEntities addLast: aTLDrawable.
	self requireUpdateAndLayoutApplication.
	