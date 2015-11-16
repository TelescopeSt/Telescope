initialization
initialize
	super initialize.
	self styleSheet: TLStyleSheet default.
	self nodeCreationStrategy: TLNodeCreationStrategy default.
	self openingDimension: 720@480.
	shouldReplaceCameraWhenUpdating := false.
	self configLayout