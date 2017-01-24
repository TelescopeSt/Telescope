accessing
addInteraction: aTLInteraction
	self interactions addLast: aTLInteraction.
	aTLInteraction container: self.
	^ aTLInteraction 