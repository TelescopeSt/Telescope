initialization
initialize
	super initialize.
	self state at: #childrenExpanded put: nil.
	self
		childrenGroup:
			(TLEntitiesGroup new
				parent: self;
				style: #children)