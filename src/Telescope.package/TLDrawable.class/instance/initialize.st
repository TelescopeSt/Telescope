initialization
initialize
	super initialize.
	interactions := OrderedCollection new.
	isUpdateRequired := false.
	isLayoutApplicationRequired := false