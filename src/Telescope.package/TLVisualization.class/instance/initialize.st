initialization
initialize
	super initialize.
	self styleSheet: TLStyleSheet default.
	self configLayout.
	shouldReplaceCameraWhenUpdating := false