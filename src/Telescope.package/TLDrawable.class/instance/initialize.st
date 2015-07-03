initialization
initialize
	super initialize.
	self initializeStyle.
	interactions := OrderedCollection new.
	isUpdateRequired := false.
	isLayoutApplicationRequired := false.
	isVisible := true.
	state := Dictionary new
	