initialization
initialize
	super initialize.
	incomingConnections := TLDrawableCollection new.
	outgoingConnections := TLDrawableCollection new.
	state := Dictionary new
	