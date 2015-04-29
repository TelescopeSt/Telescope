initialization
initialize
	super initialize.
	self connectionsByNode: Dictionary new.
	connectToOrigin := false
	