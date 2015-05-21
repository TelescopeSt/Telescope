initialization
initialize
	super initialize.
	self state at: #childrenExpanded put: true.
	self childrenGroup: (TLEntitiesGroup new parent: self).
	