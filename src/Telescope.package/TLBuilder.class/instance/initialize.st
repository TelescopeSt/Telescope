initialization
initialize
	super initialize.
	interactions := OrderedCollection new.
	defaultInteractions := #().
	self defaultInteractions: self getDefaultInteractions  