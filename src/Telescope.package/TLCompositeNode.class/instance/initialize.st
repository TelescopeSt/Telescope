initialization
initialize
	super initialize.
	self state at: #childrenExpanded put: true.
	self childrenNodes: (TLEntitiesGroup new parent: self).
	