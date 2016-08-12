initialization
initialize
	super initialize.
	state := Dictionary new.
	self initializeStyle.
	interactions := OrderedCollection new.
	isUpdateRequired := false.
	isLayoutApplicationRequired := false.
	isVisible := true