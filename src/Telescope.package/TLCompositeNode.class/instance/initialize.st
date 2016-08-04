initialization
initialize
	super initialize.
	self state at: #childrenExpanded put: nil.
	TLEntitiesGroup new
		parent: self;
		style: #children