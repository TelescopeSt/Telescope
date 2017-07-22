initialization
initialize
	super initialize.
	state := SmallDictionary new.
	self initializeStyle.
	interactions := OrderedCollection new.
	isUpdateRequired := false.
	isLayoutApplicationRequired := false.
	isVisible := true